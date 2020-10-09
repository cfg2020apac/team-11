import 'package:flutter/material.dart';

class HomePageEvents extends StatefulWidget {
  @override
  _HomePageEventsState createState() => _HomePageEventsState();
}

class _HomePageEventsState extends State<HomePageEvents> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Event " + index.toString(), style:TextStyle(fontSize:28)),
                          Text("Event description")
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }
}
