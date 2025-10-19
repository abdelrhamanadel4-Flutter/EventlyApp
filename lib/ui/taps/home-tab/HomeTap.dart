import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/firebase_ultiless.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/Event.dart';
import 'package:evently/providers/App_Theme.dart';
import 'package:evently/providers/App_language_provider.dart';
import 'package:evently/providers/eventprovider.dart';
import 'package:evently/providers/user.dart';
import 'package:evently/ui/taps/home-tab/event_tap_item.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      var eventProvider = Provider.of<EventProvider>(context, listen: false);
      if (userProvider.currentUser != null) {
        eventProvider.listenToAllEventsRealTime(userProvider.currentUser!.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppLangagueProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventProvider = Provider.of<EventProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var Userprovider = Provider.of<UserProvider>(context);

    if (Userprovider.currentUser == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    eventProvider.geteventsNameList(context);

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
        toolbarHeight: height * 0.18,
        backgroundColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back ✨', style: AppStyles.re14white),
                    Text(
                      Userprovider.currentUser?.name ?? 'Guest User',
                      style: AppStyles.bold24lightblue,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    themeProvider.changetheme(
                      themeProvider.appTheme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    );
                  },
                  child: Icon(
                    themeProvider.appTheme == ThemeMode.light
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: Theme.of(context).focusColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.016,
                    vertical: height * 0.007,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      langProvider.local == 'en'
                          ? langProvider.changeLang('ar')
                          : langProvider.changeLang('en');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.local,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Row(
              children: [
                Image.asset(
                  AppAssets.Mapunselcted,
                  color: AppColors.whitecolor,
                ),
                Text('Cairo, Egypt', style: AppStyles.medium14white),
              ],
            ),
            SizedBox(height: height * 0.01),
            DefaultTabController(
              animationDuration: const Duration(seconds: 1),
              length: eventProvider.eventNameList.length,
              child: TabBar(
                tabs: eventProvider.eventNameList.asMap().entries.map((entry) {
                  int index = entry.key;
                  String eventname = entry.value;
                  return EventTapItem(
                    eventName: eventname,
                    icon: eventsIconList[index],
                    isSelected: eventProvider.selectedindex == index,
                  );
                }).toList(),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.zero,
                onTap: (value) {
                  if (userProvider.currentUser == null) return;
                  eventProvider.changeSelectedIndex(
                    value,
                    userProvider.currentUser!.id,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: eventProvider.FilteredEvents.isEmpty
          ? const Center(child: Text('No events found'))
          : ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.02,
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.01),
              itemCount: eventProvider.FilteredEvents.length,
              itemBuilder: (context, index) {
                Event event = eventProvider.FilteredEvents[index];
                return Container(
                  width: double.infinity,
                  height: height * 0.26,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(event.eventimage),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height * 0.013,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).canvasColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02,
                            vertical: height * 0.003,
                          ),
                          child: Column(
                            children: [
                              Text(
                                event.eventdate.day.toString(),
                                style: AppStyles.bold20blue,
                              ),
                              Text(
                                DateFormat('MMM').format(event.eventdate),
                                style: AppStyles.bold14blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: height * 0.007,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    event.title,
                                    style:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppStyles.bold14offwhite
                                        : AppStyles.bold14black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (userProvider.currentUser == null)
                                      return;
                                    eventProvider.updateEvent(
                                      event,
                                      userProvider.currentUser!.id,
                                    );
                                  },
                                  child: event.isFavorite
                                      ? Image.asset(
                                          AppAssets.favselected,
                                          color: AppColors.primarycolor,
                                        )
                                      : Image.asset(
                                          AppAssets.favunselcted,
                                          color: AppColors.primarycolor,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
