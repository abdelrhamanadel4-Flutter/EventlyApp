import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/events/event_tap_item2.dart';
import 'package:evently/ui/taps/home-tab/event_tap_item.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
   AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
int selected=0;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    List<String> eventsNameList = [
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
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.createevent),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:width*0.04,
          vertical: height*0.03

        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(AppAssets.Bookclub,fit: BoxFit.fill,width: double.infinity,)),
            SizedBox(height: height*0.02,),
            DefaultTabController(
                length: eventsNameList.length, child:
            TabBar(onTap: (value) {
              selected=value;
              setState(() {

              });
            },indicatorColor: Colors.transparent,tabAlignment:
            TabAlignment.start,labelPadding: EdgeInsets.zero,dividerColor:
            Colors.transparent,
              tabs: eventsNameList.map((eventname) =>
                  EventTapItem2(  isSelected:selected==eventsNameList.indexOf(eventname) , eventName: eventname,)).toList(),
              isScrollable: true,))


          ],
        ),
      ),
    );
  }
}
