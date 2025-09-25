import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var langProvider=Provider.of<AppLangagueProvider>(context);

    ThemeData theme=Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.Logovertical,width: double.infinity,height: height*0.2),
              SizedBox(height: height*0.02,),
              TextField(
                decoration: InputDecoration(
                  hintText: (AppLocalizations.of(context)!.email),
                  prefixIcon: Image.asset(AppAssets.Email,
                    color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  )
                ),
              ),
              SizedBox(height: height*0.02,),
              TextField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: Image.asset(AppAssets.Password,
                      color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                    ),
                  suffixIcon: Image.asset(AppAssets.EYE,
                    color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  )
                ),
              ),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.ForgetPassword);
                },
                  child: Text(AppLocalizations.of(context)!.forgetPassword,textAlign: TextAlign.end,style: AppStyles.bold16blue,)),
              SizedBox(height: height*0.02,),
              FilledButton(onPressed: (){
                Navigator.pushNamed(context, AppRoutes.HomeScrean);
              }, child: Text(AppLocalizations.of(context)!.login)),
              SizedBox(height: height*0.02,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(AppLocalizations.of(context)!.dontHaveAccount,style:Theme.of(context).textTheme.headlineMedium,),
                InkWell(onTap: (){
                  Navigator.pushNamed(context, AppRoutes.Signup);
                },
                    child: Text(AppLocalizations.of(context)!.createAccount,style: AppStyles.bold16blue,)),

              ],),
              SizedBox(height: height*0.02,),
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
                Text(AppLocalizations.of(context)!.or,style: AppStyles.bold16bluenounderline,),
                Expanded(
                  child: Divider(
                    color: AppColors.primarycolor,
                    thickness: 1.5,
                    indent: 10,
                    endIndent: 30,


                  ),
                ),

              ],),
              SizedBox(height: height*0.04,),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.primarycolor
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(AppAssets.goggle),
                    SizedBox(width: width*0.02,),
                    Text(AppLocalizations.of(context)!.loginWithGoogle,style: AppStyles.bold16bluenounderline,),
                  ],
                ),
              ),
              SizedBox(height: height*0.02,),
              Center(
                child:
                AnimatedToggleSwitch<String>.rolling(
                  borderWidth: 3,
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
              )





            ],
          ),
        ),
      ),
    );
  }
}
