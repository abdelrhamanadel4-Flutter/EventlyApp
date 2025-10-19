import 'package:evently/firebase_options.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/providers/eventprovider.dart';
import 'package:evently/providers/user.dart';
import 'package:evently/ui/Authentication/forgetpassword.dart';
import 'package:evently/ui/Authentication/signin.dart';
import 'package:evently/ui/Authentication/signup.dart';
import 'package:evently/ui/Home/home%20screan.dart';
import 'package:evently/ui/events/addevent.dart';
import 'package:evently/ui/onboradingscrean/localation.dart';
import 'package:evently/ui/onboradingscrean/onborading.dart';
import 'package:evently/ui/taps/profile/profile%20tap.dart';
import 'package:evently/ultiless/AppTheme.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool showonBorading = prefs.getBool('onBorading') ?? false;
  final bool showLocal = prefs.getBool('local') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLangagueProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(showonBorading: showonBorading, showLocal: showLocal),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showonBorading;
  final bool showLocal;

  MyApp({required this.showonBorading, required this.showLocal});
  @override
  Widget build(BuildContext context) {
    var LanguageProvider = Provider.of<AppLangagueProvider>(context);
    var ThemeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      themeAnimationStyle: AnimationStyle(
        duration: Duration(seconds: 1),
        curve: Curves.bounceOut,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: showonBorading == false
          ? AppRoutes.OnBoradingLocal
          : AppRoutes.SignIn,
      routes: {
        AppRoutes.OnBoradingLocal: (context) => OnBoradingLocal(),
        AppRoutes.onBorading: (context) => OnbBrading(),
        AppRoutes.SignIn: (context) => SignIn(),
        AppRoutes.Signup: (context) => Signup(),
        AppRoutes.ForgetPassword: (context) => ForgetPassword(),
        AppRoutes.ProfileTab: (context) => ProfileTab(),
        AppRoutes.HomeScrean: (context) => HomeScrean(),
        AppRoutes.AddEvent: (context) => AddEvent(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: LanguageProvider.local.isNotEmpty
          ? Locale(LanguageProvider.local)
          : const Locale('en'),
      theme: AppTheme.light_theme,
      darkTheme: AppTheme.dark_theme,
      themeMode: ThemeProvider.appTheme,
    );
  }
}
