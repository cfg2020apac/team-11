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
      category: "Giving",
      title: "Give out Food",
    ),
    EventItem(
      category: "Giving",
      title: "Give out Money",
    ),
    EventItem(
      category: "Giving",
      title: "Give out Clothes",
    ),
    EventItem(
      category: "Donation",
      title: "Donate Money",
    ),
    EventItem(
      category: "Test A",
      title: "Donate Clothes",
    ),
    EventItem(
      category: "Test B",
      title: "Donate Clothes",
    ),
    EventItem(
      category: "Test C",
      title: "Donate Clothes",
    ),
    EventItem(
      category: "Test D",
      title: "Donate Clothes",
    ),
  ];
  return events;
}
