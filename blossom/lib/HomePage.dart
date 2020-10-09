import 'package:blossom/HomePageProgress.dart';
import 'HomePageCategories.dart';
import 'HomePageEvents.dart';
import 'event_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://banner2.cleanpng.com/20180425/rcq/kisspng-computer-icons-user-profile-encapsulated-postscrip-5ae0c2dc423176.2117820515246793882711.jpg'),
          ),
        ),
        centerTitle: true,
        title: Text("Blossom Home", style: TextStyle(fontSize: 32)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 5,
            ),
            child: GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: EventItemsSearch());
              },
              child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  enabled: false),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
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
                        listItem.title,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        listItem.category,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ));
            });
  }
}
