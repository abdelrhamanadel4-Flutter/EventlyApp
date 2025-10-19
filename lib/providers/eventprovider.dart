import 'package:evently/firebase_ultiless.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/Event.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventProvider extends ChangeNotifier {
  List<Event> events = [];
  List<Event> FilteredEvents = [];
  List<String> eventNameList = [];
  int selectedindex = 0;
  List<Event> favevent = [];
  List<String> geteventsNameList(BuildContext context) {
    return eventNameList = [
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
  }

  void listenToAllEventsRealTime(String uid) {
    FirebaseUltiless.addCOlectioninfirestore(
      uid,
    ).orderBy('eventdate').snapshots().listen((querySnapshot) {
      events = querySnapshot.docs.map((doc) => doc.data() as Event).toList();

      if (selectedindex == 0) {
        FilteredEvents = events;
      } else {
        FilteredEvents = events
            .where((event) => event.eventname == eventNameList[selectedindex])
            .toList();
      }
      notifyListeners();
    });
  }

  void getfilteredEvents(String category, String uid) {
    FirebaseUltiless.addCOlectioninfirestore(uid)
        .where('eventname', isEqualTo: eventNameList[selectedindex])
        .orderBy('eventdate')
        .get()
        .then((querySnapshot) {
          FilteredEvents = querySnapshot.docs
              .map((doc) => doc.data() as Event)
              .toList();
          notifyListeners();
        });
  }

  void updateEvent(Event event, String uid) {
    FirebaseUltiless.addCOlectioninfirestore(uid)
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite})
        .then((value) {
          Fluttertoast.showToast(
            msg: "Event updated Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        })
        .timeout(
          const Duration(milliseconds: 300),
          onTimeout: () {
            Fluttertoast.showToast(
              msg: "Event updated Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        );
  }

  void listenToFavoriteEvents(String uid) {
    FirebaseUltiless.addCOlectioninfirestore(uid)
        .where('isFavorite', isEqualTo: true)
        .orderBy('eventdate')
        .snapshots()
        .listen((snapshot) {
          favevent = snapshot.docs.map((doc) => doc.data() as Event).toList();
          notifyListeners();
        });
  }

  void changeSelectedIndex(int index, String uid) {
    selectedindex = index;
    selectedindex == 0
        ? FilteredEvents = events
        : getfilteredEvents(eventNameList[selectedindex], uid);

    notifyListeners();
  }
}
