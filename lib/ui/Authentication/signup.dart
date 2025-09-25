import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Authentication/signup.dart' as AppRoutes;
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context)!.register ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.Logovertical,width: double.infinity,height: height*0.2),
            SizedBox(height: height*0.04,),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.name,
                  prefixIcon: Image.asset(AppAssets.name,  color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  )
              ),
            ),
            SizedBox(height: height*0.02,),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: Image.asset(AppAssets.Email,                    color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  ),
              ),
            ),
            SizedBox(height: height*0.02,),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: Image.asset(AppAssets.Password, color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,),

                  suffixIcon: Image.asset(AppAssets.EYE,                    color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  )
              ),
            ),
            SizedBox(height: height*0.02,),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.rePassword,
                  prefixIcon: Image.asset(AppAssets.Password,                    color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  ),
                  suffixIcon: Image.asset(AppAssets.EYE,                    color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  )
              ),
            ),
            SizedBox(height: height*0.02,),
            FilledButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.createAccount,)),
            SizedBox(height: height*0.02,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.alreadyHaveAccount,style:Theme.of(context).textTheme.headlineMedium,),
                InkWell(onTap: (){
                  Navigator.pop(context);
                },
                    child: Text(AppLocalizations.of(context)!.login,style: AppStyles.bold16blue,)),

              ],),




          ],
        ),
      ),
    );
  }

}
