import 'package:blossom/HomePageProgress.dart';
import 'HomePageCategories.dart';
import 'HomePageEvents.dart';
import 'event_data.dart';
import 'package:flutter/material.dart';
import 'eventsPage/EventsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:               Container(
        margin: const EdgeInsets.only(top: 20),
    child: Image.asset('images/Logo_transparent.png', fit: BoxFit.fitHeight),)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: EventItemsSearch());
                },
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 3),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    enabled: false),
              )
              ),
              SizedBox(height: 20),
              Text(
                "Category",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HomePageCategories(),
              SizedBox(height: 20),
              Text(
                "Progress",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HomePageProgress(),
              SizedBox(height: 20),
              Text(
                "Event List",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HomePageEvents()
            ],
          ),
        ),
      ),
    );
  }
}

class EventItemsSearch extends SearchDelegate<EventItem> {
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //This should route to the event details page
    return Center(
        child: Text(
      query,
      style: TextStyle(fontSize: 20),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final eventList = query.isEmpty
        ? loadEventItem()
        : loadEventItem()
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return eventList.isEmpty
        ? Text("No Results Found...", style: TextStyle(fontSize: 20))
        : ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              //grabs a particular event
              final EventItem listItem = eventList[index];
              return ListTile(
                  onTap: () {
                    showResults(context);
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listItem.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        listItem.categoryName,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ));
            });
  }
}
