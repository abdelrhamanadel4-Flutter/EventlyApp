import 'package:evently/firebase_ultiless.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/user.dart';
import 'package:evently/providers/user.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/DIloag.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.Logovertical, height: height * 0.2),
              SizedBox(height: height * 0.03),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // الاسم
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.name,
                        prefixIcon: Image.asset(
                          AppAssets.name,
                          color: theme.brightness == Brightness.dark
                              ? AppColors.lightBlue
                              : null,
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // الإيميل
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.email,
                        prefixIcon: Image.asset(
                          AppAssets.Email,
                          color: theme.brightness == Brightness.dark
                              ? AppColors.lightBlue
                              : null,
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your email';
                        }
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(text);
                        if (!emailValid) return 'Please enter valid email';
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // الباسورد
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
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
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // إعادة كتابة الباسورد
                    TextFormField(
                      controller: rePasswordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.rePassword,
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
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (text != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.03),

                    FilledButton(
                      onPressed: () {
                        register();
                      },
                      child: Text(AppLocalizations.of(context)!.createAccount),
                    ),
                    SizedBox(height: height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.alreadyHaveAccount,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: AppStyles.bold16blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context, loadingText: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

        Userr myUser = Userr(
          id: credential.user?.uid ?? '',
          name: nameController.text.trim(),
          email: emailController.text.trim(),
        );

        FirebaseUltiless.addCOlectionuserinfirestore()
            .doc(credential.user?.uid)
            .set(myUser);

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(myUser);

        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: 'Registered Successfully!',
          title: 'Success',
          posActionName: 'OK',
          posAction: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.HomeScrean, (route) => false);
          },
        );
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideLoading(context: context);

        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else if (e.code == 'network-request-failed') {
          errorMessage =
              'Network error. Please Pixelcheck your internet connection.';
        } else {
          errorMessage = 'Unexpected error: ${e.message}';
        }

        DialogUtils.showMessage(
          context: context,
          message: errorMessage,
          title: 'Error',
          posActionName: 'OK',
        );
      } catch (e) {
        DialogUtils.hideLoading(context: context);
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
