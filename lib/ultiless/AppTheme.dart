import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:flutter/material.dart';

class AppTheme{
static ThemeData light_theme=ThemeData(
  primaryColor: AppColors.primarycolor,
    focusColor: AppColors.whitecolor,
    canvasColor: AppColors.lightBlue,
    dividerColor: AppColors.lightBlue,
    cardColor: AppColors.ramdi,


    colorScheme: ColorScheme(
      brightness:Brightness.light ,
      primary: AppColors.primarycolor,

        onPrimary: AppColors.lightBlue,
      secondary: AppColors.primarycolor,
      onSecondary: AppColors.lightBlue,
      error: Colors.red,
      onError: Colors.red,
      surface: AppColors.lightBlue,
      onSurface: AppColors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
      ),padding: EdgeInsets.all(16),textStyle: TextStyle(
      fontSize: 20,fontWeight: FontWeight.w500
    )
    )
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
        textStyle: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w500
        ),padding: EdgeInsets.all(16),
foregroundColor: AppColors.primarycolor,

    )
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
        ),padding: EdgeInsets.all(16),textStyle: TextStyle(
        fontSize: 20,fontWeight: FontWeight.w500,
        color: AppColors.whitecolor

    )    )
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.primarycolor,
    centerTitle: true,
    titleTextStyle: AppStyles.medium20blue,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColors.primarycolor
    ),
  ),
  inputDecorationTheme:InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: AppColors.ramdi,
        width: 1
      ),

    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
          color: AppColors.ramdi,
          width: 1
      ),

    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
          color: AppColors.ramdi,
          width: 1
      ),

    ),errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
        color: Colors.red,
        width: 2
    ),


  ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
          color: Colors.red,
          width: 2
      ),

    ),
    prefixIconColor: AppColors.ramdi,
    suffixIconColor: AppColors.ramdi,
    hintStyle: TextStyle(fontSize: 16,color: AppColors.ramdi),

  ),
    scaffoldBackgroundColor: AppColors.lightBlue,
  textTheme: TextTheme(
    headlineLarge: AppStyles.bold20black,
    headlineMedium: AppStyles.medium16black,
    headlineSmall: AppStyles.medium16ramdi,
    labelLarge: AppStyles.medium16blue,
      labelMedium:AppStyles.medium16lightblue,
    labelSmall: AppStyles.bold14blue,
      titleLarge: AppStyles.bold16white,
      displaySmall: AppStyles.bold16bluenounderline,
    bodyLarge: AppStyles.medium16ramdi,







  )

);
static ThemeData dark_theme=ThemeData(
  primaryColor: AppColors.darkPurple,
    focusColor: AppColors.offWhite,
    canvasColor: Colors.transparent,
    dividerColor: AppColors.primarycolor,
    cardColor: AppColors.offWhite,



    colorScheme: ColorScheme(
        brightness:Brightness.dark ,
        primary: AppColors.primarycolor,
        onPrimary: AppColors.darkPurple,
        secondary: AppColors.offWhite,
        onSecondary: AppColors.darkPurple,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.darkPurple,
        onSurface: AppColors.offWhite),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
            ),padding: EdgeInsets.all(16),textStyle: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w500
        )
        )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
            textStyle: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w500
            ),padding: EdgeInsets.all(16),
            foregroundColor: AppColors.primarycolor


        )
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
            ),padding: EdgeInsets.all(16),textStyle: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w500,
          color: AppColors.whitecolor
        )    )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.whitecolor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppStyles.medium20blue,
      iconTheme: IconThemeData(
          color: AppColors.primarycolor
      ),
    ),
    inputDecorationTheme:InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 16,color: AppColors.offWhite),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: AppColors.primarycolor,
            width: 1
        ),

      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: AppColors.primarycolor,
            width: 1
        ),

      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: AppColors.primarycolor,
            width: 1
        ),

      ),errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
          color: Colors.red,
          width: 2
      ),

    ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: Colors.red,
            width: 2
        ),

      ),
      prefixIconColor: AppColors.offWhite,
      suffixIconColor: AppColors.offWhite,
    ),
    scaffoldBackgroundColor: AppColors.darkPurple,
textTheme: TextTheme(

    headlineLarge: AppStyles.bold20offwhite,
  headlineMedium: AppStyles.medium16offwhite,
  headlineSmall: AppStyles.medium16offwhite,
    labelLarge: AppStyles.medium16offwhite,
  labelMedium:AppStyles.medium16offwhite,
    labelSmall: AppStyles.bold14darkblue,
  titleLarge: AppStyles.bold16darkblue,
  displaySmall: AppStyles.bold16bluenounderline,
  bodyLarge: AppStyles.medium16offwhite





)


);

}