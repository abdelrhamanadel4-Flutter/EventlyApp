import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}
class _ProfileTabState extends State<ProfileTab> {
  String? selected;
  String? selectedTheme;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var langProvider=Provider.of<AppLangagueProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    selected = AppLocalizations.of(context)!.english;
    selectedTheme=AppLocalizations.of(context)!.light;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height*0.18,
        backgroundColor: AppColors.primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(64)
          ),
        ),
        title: Row(
            children: [
          Image.asset(AppAssets.logoappbar),
          SizedBox(width: width*0.03,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Abdelrman Adel',style: AppStyles.bold24lightblue,),
              SizedBox(height: height*0.01,),
              Text('AbdelrmanAdel.route@gmail.com',softWrap: true,overflow: TextOverflow.visible,style: AppStyles.medium16lightblue,),
            ],),
          )

        ]),

      ),

      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(vertical: height*0.04,horizontal: width*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: height*0.02,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primarycolor),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primarycolor),
                      borderRadius: BorderRadius.circular(16)

                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: height*0.02  ,horizontal: width*0.04)
              ),
              items: [AppLocalizations.of(context)!.english,
                AppLocalizations.of(context)!.arabic].map((e) =>
                  DropdownMenuItem(child: Text('$e'),value: e,),).toList(),
              onChanged: (val){
                if(val==AppLocalizations.of(context)!.english){
                  langProvider.changeLang('en');
                }else{
                  langProvider.changeLang('ar');
                }
                setState(() {
                  selected=val;
                });
              },
              value:selected,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.keyboard_arrow_down, color: AppColors.primarycolor),
              ),
              dropdownColor: Colors.white,
              style: AppStyles.bold20blue,),
            SizedBox(height: height*0.02,),
            Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: height*0.02,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primarycolor),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primarycolor),
                      borderRadius: BorderRadius.circular(16)

                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: height*0.02  ,horizontal: width*0.04)
              ),
              items: [AppLocalizations.of(context)!.light,
                AppLocalizations.of(context)!.dark].map((e) =>
                  DropdownMenuItem(child: Text('$e'),value: e,),).toList(),
              onChanged: (val){
                if(val==AppLocalizations.of(context)!.light){
                  themeProvider.changetheme(ThemeMode.light);
                }else{
                  themeProvider.changetheme(ThemeMode.dark);
                }
                setState(() {
                  selectedTheme=val;
                });
              },
              value:selectedTheme,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.keyboard_arrow_down, color: AppColors.primarycolor),
              ),
              dropdownColor: Colors.white,
              style: AppStyles.bold20blue,),

            Spacer(),
            FilledButton(onPressed: (){
              Navigator.popUntil(context, (route) => route.settings.name==AppRoutes.SignIn,);
            }, child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.02),
              child: Row(
                children: [
                  Icon(Icons.logout,color: Colors.white,),
                  SizedBox(width: width*0.02,),
                  Text(AppLocalizations.of(context)!.logout,style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),
            style: FilledButton.styleFrom(
              backgroundColor:Color(0XFFFF5659)

            )
            ),
          ],
        ),
      )),

    );
  }
}


