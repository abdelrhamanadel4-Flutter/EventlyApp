class Event {
  static const String collectionName = 'events';
  String id;
  String title;
  DateTime eventdate;
  String eventtime;
  bool isFavorite;
  String eventname;
  String description;
  String eventimage;

  Event({
    this.id = '',
    required this.title,
    required this.eventdate,
    required this.eventtime,
    this.isFavorite = false,
    required this.eventname,
    required this.description,
    required this.eventimage,
  });

  //to do json to object
  Event.fromFirestore(Map<String, dynamic> data)
    : this(
        id: data['id'] ?? '',
        title: data['title'] ?? '',
        eventdate: DateTime.fromMicrosecondsSinceEpoch(data['eventdate'] ?? 0),
        eventtime: data['eventtime'] ?? '',
        isFavorite: data['isFavorite'] ?? false,
        eventname: data['eventname'] ?? '',
        description: data['description'] ?? '',
        eventimage: data['eventimage'] ?? '',
      );
  // to do object json
  Map<String, dynamic> toFirebase() {
    return {
      'id': id,
      'title': title,
      'eventdate': eventdate.microsecondsSinceEpoch,
      'eventtime': eventtime,
      'isFavorite': isFavorite,
      'eventname': eventname,
      'description': description,
      'eventimage': eventimage,
    };
  }
}
