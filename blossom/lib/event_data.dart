import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventItem {
  final String name;
  final String categoryName;
  final int badgeType;
  final int capacity;
  final String contactName;
  final int contactNumber;
  final DateFormat date;
  final String description;
  final int hours;
  final List<String> images;
  final String locationBranch;
  final int registered;

  EventItem(
      this.name,
      this.categoryName,
      this.badgeType,
      this.capacity,
      this.contactName,
      this.contactNumber,
      this.date,
      this.description,
      this.hours,
      this.images,
      this.locationBranch,
      this.registered);
}

List<EventItem> loadEventItem() {
  var events = <EventItem>[];
  return events;
}
