import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';

import '../../ultiless/approutes.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});
  final fromKey=GlobalKey<FormState>();

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
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.FORGET),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text==null || text.trim().isEmpty)
                    return 'please enter email';
                  final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                  if(!emailValid){
                    return 'Please enter Vaild Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: Image.asset(AppAssets.Email, color: theme.brightness == Brightness.dark ? AppColors.lightBlue : null,
                  ),
                ),
              ),
              SizedBox(height: height*0.02,),

              FilledButton(onPressed: (){
                if(fromKey.currentState?. validate()==true) {
                  Navigator.pushNamed(context, AppRoutes.SignIn);
                }

              }, child: Text(AppLocalizations.of(context)!.resetPassword))
            ],
          ),
        ),
      ),
    );

  }
}
