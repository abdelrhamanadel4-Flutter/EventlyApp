import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/taps/home-tab/HomeTap.dart';
import 'package:evently/ui/taps/Map-tab/MapTap.dart';
import 'package:evently/ui/taps/love-tab/LoveTap.dart';
import 'package:evently/ui/taps/profile/profile%20tap.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});


  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  List<Widget> pages=[
    HomeTap(),
    MapTap(),
    LoveTap(),
    ProfileTab(),
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color:Theme.of(context).focusColor,size: 40,),
        backgroundColor: Theme.of(context).primaryColor,
        shape:StadiumBorder(
          side: BorderSide(width: 4,color: AppColors.whitecolor)
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.AddEvent);
      },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).focusColor,
        unselectedItemColor: Theme.of(context).focusColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selected,
        unselectedLabelStyle:ThemeMode.light==Theme.of(context).brightness?AppStyles.bold12white:AppStyles.bold12offwhite,
        selectedLabelStyle:ThemeMode.light==Theme.of(context).brightness?AppStyles.bold12white:AppStyles.bold12offwhite,
        onTap: (value) {
          selected=value;
          setState(() {

          });
        },
        items: [
          getBottomNavigationBarItem(label:AppLocalizations.of(context)!.home ,index:0 ,selectedicon:AppAssets.HomeFill ,unselected:AppAssets.Homeunselected ),
          getBottomNavigationBarItem(label:AppLocalizations.of(context)!.map ,index:1 ,selectedicon:AppAssets.MapFill ,unselected:AppAssets.Mapunselcted ),
          getBottomNavigationBarItem(label:AppLocalizations.of(context)!.love,index:2 ,selectedicon:AppAssets.favFill ,unselected:AppAssets.favunselcted ),
          getBottomNavigationBarItem(label:AppLocalizations.of(context)!.profile ,index:3 ,selectedicon:AppAssets.profileFill ,unselected:AppAssets.profileunselected ),

        ]
      ),
      body:pages[selected] ,

    );
  }
  getBottomNavigationBarItem({required String selectedicon,required String unselected,required String label,required int index}){
    return BottomNavigationBarItem(
      icon: selected==index?Image.asset(selectedicon):Image.asset(unselected),
      label: label,
    );

  }
}
