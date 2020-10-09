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
      appBar: AppBar(title: Text("HomePage"),),
      body: Center(
        child: RaisedButton(
          child: Text('Events'),
          onPressed: () {
              // Navigate to events when tapped.
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventsPage()),
            );
          },
        ),
      ),
    );
  }


}
