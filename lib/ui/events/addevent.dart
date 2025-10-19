import 'package:evently/firebase_ultiless.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/Event.dart';
import 'package:evently/providers/user.dart';
import 'package:evently/ui/events/event_tap_item2.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selected = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedtime;
  String? format = '';
  final formkey = GlobalKey<FormState>();

  // Errors
  String? dateError;
  String? timeError;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
    List<IconData> eventsIconList = [
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
    List<String> eventsAssetsList = [
      AppAssets.sport,
      AppAssets.brithday,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.workshop,
      AppAssets.bookclub,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.createevent),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.03,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    eventsAssetsList[selected],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: height * 0.02),
                DefaultTabController(
                  animationDuration: Duration(seconds: 1),
                  length: eventsNameList.length,
                  child: TabBar(
                    tabs: eventsNameList.asMap().entries.map((entry) {
                      int index = entry.key;
                      String eventname = entry.value;
                      return EventTapItem2(
                        eventName: eventname,
                        icon: eventsIconList[index],
                        isSelected: selected == index,
                      );
                    }).toList(),
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.zero,
                    onTap: (value) {
                      selected = value;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: height * 0.01),
                TextFormField(
                  controller: textEditingController,
                  validator: (Text) {
                    if (Text == null || Text.trim().isEmpty)
                      return 'please enter event title';
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      AppAssets.titleicon,
                      color: Theme.of(context).cardColor,
                    ),
                    hintText: AppLocalizations.of(context)!.eventtitle,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: height * 0.01),
                TextFormField(
                  controller: descriptionController,
                  validator: (Text) {
                    if (Text == null || Text.trim().isEmpty)
                      return 'please enter event decrption';
                    return null;
                  },
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.eventdescription,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.Calendaricon,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      AppLocalizations.of(context)!.eventtime,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        var choosedate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        selectedDate = choosedate;
                        setState(() {
                          dateError = null;
                        });
                      },
                      child: Text(
                        selectedDate == null
                            ? AppLocalizations.of(context)!.choosedate
                            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        style: AppStyles.medium16blue,
                      ),
                    ),
                  ],
                ),
                if (dateError != null)
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 4),
                    child: Text(
                      dateError!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.Clockicon,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      AppLocalizations.of(context)!.eventtime,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        var chossetime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        selectedtime = chossetime;
                        if (selectedtime != null) {
                          format = selectedtime!.format(context);
                        }
                        setState(() {
                          timeError = null;
                        });
                      },
                      child: Text(
                        selectedtime == null
                            ? AppLocalizations.of(context)!.choosetime
                            : '${format}',
                        style: AppStyles.medium16blue,
                      ),
                    ),
                  ],
                ),
                if (timeError != null)
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 4),
                    child: Text(
                      timeError!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                SizedBox(height: height * 0.01),
                Text(
                  AppLocalizations.of(context)!.location,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: height * 0.01),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primarycolor),
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.013,
                      horizontal: width * 0.02,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.026,
                          vertical: height * 0.0129,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primarycolor,
                        ),
                        child: Image.asset(
                          AppAssets.locationmap,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        AppLocalizations.of(context)!.chooseeventlocation,
                        style: AppStyles.medium16blue,
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      dateError = selectedDate == null
                          ? "Please choose a date"
                          : null;
                      timeError = selectedtime == null
                          ? "Please choose a time"
                          : null;
                    });

                    if (formkey.currentState?.validate() == true &&
                        selectedDate != null &&
                        selectedtime != null) {
                      Event event = Event(
                        title: textEditingController.text,
                        eventdate: selectedDate!,
                        eventtime: format!,
                        eventname: eventsNameList[selected],
                        description: descriptionController.text,
                        eventimage: eventsAssetsList[selected],
                      );
                      var userProvider = Provider.of<UserProvider>(
                        context,
                        listen: false,
                      );
                      FirebaseUltiless.addEventinfirestore(
                            event,
                            userProvider.currentUser!.id,
                          )
                          .then((value) {
                            Fluttertoast.showToast(
                              msg: "Event Add Succesfly",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.of(
                              context,
                            ).pushNamed(AppRoutes.HomeScrean);
                          })
                          .timeout(
                            Duration(seconds: 2),
                            onTimeout: () {
                              Fluttertoast.showToast(
                                msg: " Event Add Succesfly",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.HomeScrean);

                              return Future.value();
                            },
                          );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.addevent,
                    style: AppStyles.Medium20white,
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
