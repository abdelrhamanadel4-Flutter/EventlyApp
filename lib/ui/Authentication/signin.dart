import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/firebase_ultiless.dart';
import 'package:evently/google.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/user.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/providers/eventprovider.dart';
import 'package:evently/providers/user.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/DIloag.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var langProvider = Provider.of<AppLangagueProvider>(context);

    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Form(
            key: fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.Logovertical,
                  width: double.infinity,
                  height: height * 0.2,
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty)
                      return 'please enter email';
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text);
                    if (!emailValid) {
                      return 'Please enter Vaild Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: (AppLocalizations.of(context)!.email),
                    prefixIcon: Image.asset(
                      AppAssets.Email,
                      color: theme.brightness == Brightness.dark
                          ? AppColors.lightBlue
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: Image.asset(
                      AppAssets.Password,
                      color: theme.brightness == Brightness.dark
                          ? AppColors.lightBlue
                          : null,
                    ),
                    suffixIcon: Image.asset(
                      AppAssets.EYE,
                      color: theme.brightness == Brightness.dark
                          ? AppColors.lightBlue
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.ForgetPassword);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    textAlign: TextAlign.end,
                    style: AppStyles.bold16blue,
                  ),
                ),
                SizedBox(height: height * 0.02),
                FilledButton(
                  onPressed: () async {
                    login();
                  },
                  child: Text(AppLocalizations.of(context)!.login),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAccount,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.Signup);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: AppStyles.bold16blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.primarycolor,
                        thickness: 1.5,
                        indent: 30,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: AppStyles.bold16bluenounderline,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.primarycolor,
                        thickness: 1.5,
                        indent: 10,
                        endIndent: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primarycolor),
                  ),
                  onPressed: () async {
                    DialogUtils.showLoading(
                      context: context,
                      loadingText: 'Signing in with Google...',
                    );

                    try {
                      final googleService = GoogleSignInService();
                      await googleService.initialize(
                        onSignIn: (googleUser) async {
                          // تحويل حساب Google إلى بيانات Firebase
                          final credential = await googleService
                              .getFirebaseCredential(googleUser);
                          final userCredential = await FirebaseAuth.instance
                              .signInWithCredential(credential);

                          // قراءة المستخدم من Firestore
                          var user = await FirebaseUltiless.readuser(
                            userCredential.user?.uid ?? '',
                          );

                          // لو المستخدم جديد أول مرة يدخل بجوجل → نحفظه في Firestore
                          if (user == null) {
                            await FirebaseUltiless.adduser(
                              userCredential.user?.uid ?? '',
                              googleUser.displayName ?? 'No Name',
                              googleUser.email,
                            );
                            user = await FirebaseUltiless.readuser(
                              userCredential.user?.uid ?? '',
                            );
                          }

                          // حفظ بيانات المستخدم في الـ Provider
                          var userProvider = Provider.of<UserProvider>(
                            context,
                            listen: false,
                          );
                          Userr myuser = Userr(
                            id: user!.id,
                            name: user.name,
                            email: user.email,
                          );

                          userProvider.setUser(user);

                          // إعادة تحميل قائمة الأحداث
                          var eventListProvider = Provider.of<EventProvider>(
                            context,
                            listen: false,
                          );
                          eventListProvider.changeSelectedIndex(
                            0,
                            userProvider.currentUser!.id,
                          );

                          DialogUtils.hideLoading(context: context);

                          // عرض رسالة نجاح
                          DialogUtils.showMessage(
                            context: context,
                            message: 'Login with Google Successfully.',
                            title: 'Success',
                            posActionName: 'OK',
                            posAction: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.HomeScrean);
                            },
                          );
                        },
                        onError: (error) {
                          DialogUtils.hideLoading(context: context);
                          DialogUtils.showMessage(
                            context: context,
                            message: error.toString(),
                            title: 'Error',
                            posActionName: 'OK',
                          );
                        },
                      );

                      // بدء عملية تسجيل الدخول بجوجل
                      await googleService.signIn();
                    } catch (e) {
                      DialogUtils.hideLoading(context: context);
                      DialogUtils.showMessage(
                        context: context,
                        message: e.toString(),
                        title: 'Error',
                        posActionName: 'OK',
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.goggle),
                      SizedBox(width: width * 0.02),
                      Text(
                        AppLocalizations.of(context)!.loginWithGoogle,
                        style: AppStyles.bold16bluenounderline,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: AnimatedToggleSwitch<String>.rolling(
                    borderWidth: 3,
                    current: langProvider.local,
                    values: ['en', 'ar'],
                    onChanged: (value) async {
                      if (value == 'en') {
                        langProvider.changeLang('e n');
                      } else {
                        langProvider.changeLang('ar');
                      }
                      langProvider.local = value;
                      setState(() {});
                    },
                    iconBuilder: (value, foreground) {
                      if (value == 'en') {
                        return Image.asset(AppAssets.LR);
                      } else {
                        return Image.asset(AppAssets.EG);
                      }
                    },
                    style: ToggleStyle(
                      borderColor: AppColors.primarycolor,
                      indicatorColor: AppColors.primarycolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (fromKey.currentState?.validate() == true) {
      //todo: login
      //todo: show loading
      DialogUtils.showLoading(context: context, loadingText: 'Waiting...');
      try {
        //todo: sign in firebase auth
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: email.text,
              password: password.text,
            ); //todo: read user from fireStore
        var user = await FirebaseUltiless.readuser(credential.user?.uid ?? '');
        if (user == null) {
          return;
        }
        //todo: save user in provider
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(user);

        var eventListProvider = Provider.of<EventProvider>(
          context,
          listen: false,
        );
        eventListProvider.changeSelectedIndex(0, userProvider.currentUser!.id);
        //todo: hide loading
        DialogUtils.hideLoading(context: context);
        //todo: show Message
        DialogUtils.showMessage(
          context: context,
          message: 'Login Successfully.',
          title: 'Success',
          posActionName: 'OK',
          posAction: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HomeScrean);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          //todo: hide loading
          DialogUtils.hideLoading(context: context);
          //todo: show Message
          DialogUtils.showMessage(
            context: context,
            message:
                'The supplied auth credential is incorrect, malformed or has expired.',
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (e.code == 'network-request-failed') {
          //todo: hide loading
          DialogUtils.hideLoading(context: context);
          //todo: show Message
          DialogUtils.showMessage(
            context: context,
            message:
                'A network error (such as timeout, interrupted connection or unreachable host)'
                ' has occurred.',
            title: 'Error',
            posActionName: 'OK',
          );
        }
      } catch (e) {
        //todo: hide loading
        DialogUtils.hideLoading(context: context);
        //todo: show Message
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: 'Error',
          posActionName: 'OK',
        );
      }
    }
  }
}
