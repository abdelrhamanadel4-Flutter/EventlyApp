import 'dart:math';
import 'package:evently/model/Event.dart';
import 'package:evently/providers/eventprovider.dart';
import 'package:evently/providers/user.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LoveTap extends StatefulWidget {
  LoveTap({super.key});

  @override
  State<LoveTap> createState() => _LoveTapState();
}

class _LoveTapState extends State<LoveTap> {
  late UserProvider userProvider;
  late EventProvider eventProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      eventProvider = Provider.of<EventProvider>(context, listen: false);

      if (userProvider.currentUser != null) {
        print(
          "✅ userProvider initialized with: ${userProvider.currentUser!.id}",
        );
        eventProvider.listenToFavoriteEvents(userProvider.currentUser!.id);
      } else {
        print("⚠️ userProvider.currentUser is NULL in LoveTap initState");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var eventProvider = Provider.of<EventProvider>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primarycolor,
                  size: 30,
                ),
                hintText: 'Search for Event',
                hintStyle: AppStyles.bold14blue,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: BorderRadius.circular(16),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: eventProvider.favevent.isEmpty
                  ? Center(child: Text('No favorite events yet 💔'))
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                        horizontal: width * 0.02,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: height * 0.01),
                      itemCount: eventProvider.favevent.length,
                      itemBuilder: (context, index) {
                        Event event = eventProvider.favevent[index];
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
                                        DateFormat(
                                          'MMM',
                                        ).format(event.eventdate),
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSecondary,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.01,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            if (userProvider.currentUser ==
                                                null) {
                                              print(
                                                "⚠️ Can't toggle favorite: userProvider.currentUser is NULL",
                                              );
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Please login first to use favorites ❤️",
                                                  ),
                                                ),
                                              );
                                              return;
                                            }

                                            print(
                                              "❤️ Favorite clicked for event: ${event.title}",
                                            );
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
            ),
          ],
        ),
      ),
    );
  }
}
