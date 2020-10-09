import 'package:cloud_firestore/cloud_firestore.dart';

class EventItem {
  final String title;
  final String category;

  EventItem({
    this.title,
    this.category,
  });
}

List<EventItem> loadEventItem() {
  var events = <EventItem>[
    EventItem(
      category: "Experiences",
      title: "Discovering Treasure Through Stories",
    ),
    EventItem(
      category: "Donation",
      title: "Event 2",
    ),
    EventItem(
      category: "Food",
      title: "Event 3",
    ),
  ];
  return events;
}
