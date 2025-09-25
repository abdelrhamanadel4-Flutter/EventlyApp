import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLangagueProvider()),
       ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ],
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var LanguageProvider=Provider.of<AppLangagueProvider>(context);
    var ThemeProvider=Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      themeAnimationStyle:AnimationStyle(
        duration: Duration(seconds: 1),curve: Curves.bounceOut

      ) ,
      debugShowCheckedModeBanner: false,
      initialRoute:  AppRoutes.OnBoradingLocal,
      routes: {
        AppRoutes.OnBoradingLocal:(context)=>OnBoradingLocal(),
        AppRoutes.onBorading:(context)=>OnbBrading(),
        AppRoutes.SignIn:(context)=>SignIn(),
        AppRoutes.Signup:(context)=>Signup(),
        AppRoutes.ForgetPassword:(context)=>ForgetPassword(),
        AppRoutes.ProfileTab:(context)=>ProfileTab(),
        AppRoutes.HomeScrean:(context)=>HomeScrean(),
        AppRoutes.AddEvent:(context)=>AddEvent(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(LanguageProvider.local),
      theme:AppTheme.light_theme ,
      darkTheme: AppTheme.dark_theme,
      themeMode: ThemeProvider.appTheme,

    );
  }

}