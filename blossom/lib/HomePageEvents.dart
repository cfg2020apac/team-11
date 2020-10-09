import 'package:blossom/eventsPage/EventsPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'eventsPage/EventsPage.dart';
import 'package:intl/intl.dart';

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
                padding: EdgeInsets.only(top: 6, bottom: 6),
                height: 150,
                child: Card(
                    elevation: 5,
                    child: new InkWell(
                        onTap: () {
                          print(list[index].runtimeType);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EventsPage(msg: list[index])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(list[index]['images'][0]),
                                  fit: BoxFit.fitWidth,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
                                  alignment: Alignment.topCenter)),
                          child: Stack(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(list[index]['name'],
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Image.asset('images/date_icon.png',
                                              scale: 2,
                                              color: Colors.white,),
                                          Text(
                                            DateFormat(' d MMM, yy   kk:mm a')
                                                .format(list[index]['date']
                                                    .toDate()),
                                            style:
                                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ))),
              );
            },
          );
        },
      ),
    );
  }
}
