import 'package:blossom/eventsPage/EventsPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'eventsPage/EventsPage.dart';

class HomePageEvents extends StatefulWidget {
  @override
  _HomePageEventsState createState() => _HomePageEventsState();
}

class _HomePageEventsState extends State<HomePageEvents> {
  Query query = FirebaseFirestore.instance.collection('events');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (stream.hasError) {
            return Center(child: Text(stream.error.toString()));
          }

          final List<QueryDocumentSnapshot> list = stream.data.docs;

          return ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: stream.data.size,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                child: Card(
                    elevation: 5,
                    child : new InkWell(
                    onTap : (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventsPage()),
                      );
                    },
    
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                              image: NetworkImage(list[index]['images'][0]),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter)),
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(list[index]['name'],
                                      style: TextStyle(
                                          fontSize: 28, color: Colors.white)),
                                ],
                              ))
                        ],
                      ),
                    )
                  )
                ),
              );
            },
          );
        },
      ),
    );
  }
}
