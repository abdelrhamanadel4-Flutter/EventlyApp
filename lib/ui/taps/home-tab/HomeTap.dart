import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/ui/taps/home-tab/event_tap_item.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}
int selectedindex=0;
class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    var langProvider=Provider.of<AppLangagueProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<IconData> eventsIconList = [
      Icons.explore,
      Icons.directions_bike,
      Icons.cake,
      Icons.meeting_room,
      Icons.sports_basketball,
      Icons.work,
      Icons.book,
      Icons.image,
      Icons.holiday_village,
      Icons.fastfood,

    ];



    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        toolbarHeight: height*0.18,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24)
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back ✨',style:AppStyles.re14white ,),
                    Text('Abdelrhman Adel',style:AppStyles.bold24lightblue ,),
                  ],
                ),
                Spacer(),
                GestureDetector(
                    onTap: (){
                      themeProvider.changetheme(themeProvider.appTheme==ThemeMode.light?ThemeMode.dark:ThemeMode.light);
                    },
                    child: themeProvider.appTheme==ThemeMode.light?Icon(Icons.light_mode,color: Theme.of(context).focusColor):Icon(Icons.dark_mode,color: Theme.of(context).focusColor)) ,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width*0.016,
                    vertical: height*0.007
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: GestureDetector(
                      onTap: (){
                        langProvider.local=='en'?langProvider.changeLang('ar'):langProvider.changeLang('en');
                      },
                      child: Text(  AppLocalizations.of(context)!.local,style: Theme.of(context).textTheme.labelSmall,)),
                )
              ],
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [
                Image.asset(AppAssets.Mapunselcted,color: AppColors.whitecolor,),
                Text('Cairo, Egypt',style:AppStyles.medium14white ,),
              ],
            ),
            SizedBox(height: height*0.01,),
            DefaultTabController(animationDuration: Duration(seconds: 1),length: eventsNameList.length, child:
                TabBar(tabs:
                    eventsNameList.asMap().entries.map((entry) {
                      int index = entry.key;
                      String eventname = entry.value;
                      return EventTapItem(eventName:eventname ,icon: eventsIconList[index] ,isSelected:selectedindex==index);
                    }).toList(),isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.zero,
                  onTap: (value) {
                    selectedindex=value;
                    setState(() {

                    });
                  } ,

                )

            )

          ],

        ),
      ),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.01),
        child: ListView.separated(padding: EdgeInsets.symmetric(vertical: height*0.01),separatorBuilder: (context, index) => SizedBox(height: height*0.01,),itemBuilder: (context, index) =>Container(
          width: double.infinity,
          height: height*0.26,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.Frame19),fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width*0.02,
                  vertical: height*0.013
                ),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).canvasColor
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width*0.02,
                    vertical: height*0.003
                  ),
                  child: Column(
                    children: [
                      Text('21',style: AppStyles.bold20blue,),
                      Text('Nov',style: AppStyles.bold14blue,),
                    ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: height*0.007
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: width*0.02,
                      vertical: height*0.01
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('This is a Birthday Party ',style: Theme.of(context).brightness == Brightness.dark?AppStyles.bold14offwhite:AppStyles.bold14black,),
                        Image.asset(AppAssets.favFill,color: AppColors.primarycolor,)
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) ,itemCount: 10,),
      ) ,

    );
  }
}
