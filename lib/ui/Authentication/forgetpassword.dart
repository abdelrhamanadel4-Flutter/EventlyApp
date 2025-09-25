import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forgetPasswordnot
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.FORGET),
            TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: Image.asset(AppAssets.Email, color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                ),
              ),
            ),
            SizedBox(height: height*0.02,),

            FilledButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.resetPassword))
          ],
        ),
      ),
    );

  }
}
