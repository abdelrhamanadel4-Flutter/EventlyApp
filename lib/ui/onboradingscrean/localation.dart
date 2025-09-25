import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';

class OnBoradingLocal extends StatefulWidget {
  OnBoradingLocal({super.key});

  @override
  State<OnBoradingLocal> createState() => _OnbBradingState();
}

class _OnbBradingState extends State<OnBoradingLocal> {
  int currentindex=0;
  final controller=LiquidController();


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var langProvider=Provider.of<AppLangagueProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.logo,height: height*0.2,width: double.infinity,),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(AppAssets.onborading),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height*0.04,),
                          Text(AppLocalizations.of(context)!.personalizeYourExperience,style: AppStyles.bold20blue ,),
                          SizedBox(height: height*0.02,),
                          Text(AppLocalizations.of(context)!.chooseYourPreferredThemeAndLanguage,style:Theme.of(context).textTheme.headlineMedium ,),
                          SizedBox(height: height*0.02,),
          
                          Row(
                            children: [
                              Text(AppLocalizations.of(context)!.language,style: AppStyles.medium20blue,),
                              Spacer(),
                              AnimatedToggleSwitch<String>.rolling(
                                  current:langProvider.local ,
                                  values: ['en','ar'],
                                  onChanged: (value) async {
                                    if(value=='en'){
                                      langProvider.changeLang('en');
                                    }else{
                                      langProvider.changeLang('ar');
                                    }
                                    langProvider.local=value;
                                    setState(() {
          
                                    });
                                  },
                                iconBuilder:(value, foreground) {
                                  if(value=='en'){
                                    return Image.asset(AppAssets.LR);
                                  }
                                  else{
                                    return Image.asset(AppAssets.EG);
                                  }
                                },
                                style: ToggleStyle(
                                  borderColor: AppColors.primarycolor,
                                  indicatorColor:AppColors.primarycolor ,
                                ),
          
                              )
          
                            ],
                          ),
                          SizedBox(height: height*0.02,),
          
                          Row(
                            children: [
                              Text(AppLocalizations.of(context)!.theme,style: AppStyles.medium20blue,),
                              Spacer(),
                              AnimatedToggleSwitch<ThemeMode>.rolling(
                                current:themeProvider.appTheme ,
                                values: [ThemeMode.light,ThemeMode.dark],
                                onChanged: (value) async {
                                  if(value==ThemeMode.light){
                                    themeProvider.changetheme(ThemeMode.light);
                                  }else{
                                    themeProvider.changetheme(ThemeMode.dark);
          
                                  }
                                  themeProvider.appTheme=value;
                                  setState(() {
          
                                  });
                                },
                                iconBuilder:(value, foreground) {
                                  if(value==ThemeMode.light){
                                    return Icon(Icons.light_mode,color: Colors.white,);
                                  }
                                  else{
                                    return Icon(Icons.dark_mode);
                                  }
                                },
                                style: ToggleStyle(
                                  borderColor: AppColors.primarycolor,
                                  indicatorColor:AppColors.primarycolor ,
                                ),
          
                              )
                            ],
                          ),
                          SizedBox(height: height*0.02,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FilledButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, AppRoutes.onBorading);
                                }, child: Text(AppLocalizations.of(context)!.letsStart,style:TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),))
                            ],
                          )
          
                        ],
                      ),
                    ),
          
                  ],
                ),
          
              ),
          
          
            ],
          ),
        ),
      );
  }


}
