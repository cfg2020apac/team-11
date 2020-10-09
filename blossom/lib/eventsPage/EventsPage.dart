import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/Gallery.dart';
import 'package:intl/intl.dart';

class EventsPage extends StatefulWidget {
  final QueryDocumentSnapshot msg;

  EventsPage({@required this.msg});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime eventTime = widget.msg['date'].toDate();
    DateTime trainingTime = widget.msg['date'].toDate();
    String eventTimeString = DateFormat('EEE, d MMM, yyyy').format(eventTime);
    String ageRequirement = "10-12";
    String trainingTimeString = DateFormat(' d MMM, yyyy').format(trainingTime);
    String eventDescription = widget.msg['description'];
    List participants = widget.msg['participants'];
    // String eventTimeString = DateFormat.yMMMMd().add_jm().format(eventTime);
    double kDefaultPaddin = 10;
    return Material(
      child: Column(
        children: <Widget>[
          Gallery(
            size: size,
            imageUrls: widget.msg["images"],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,
                          child: Column(
                            children: [
                              Text(widget.msg['name'],
                                  style: TextStyle(
                                      fontSize: 32, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(widget.msg["badge_url"]),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 3, color: Colors.black,),
                  SizedBox(height: 10),
                  Row(children: [
                    Image.asset(
                      'images/date_icon.png',
                      scale: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(eventTimeString, style: TextStyle(fontSize: 20)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('images/duration_icon.png', scale: 3.3),
                          SizedBox(width: 10),
                          Text(widget.msg['hours'].toString() + 'hours',
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(height: 10),
                  Text('Age Requirement: ' + ageRequirement,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Training Session: ' + trainingTimeString,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Participants:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Expanded(
                          child: ListView.builder(
                              itemCount: participants.length,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      NetworkImage(participants[index]),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Divider(),
                  Text("Event Description",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Text(widget.msg['description']),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.blueAccent,
              onPressed: () {},
              child: Center(
                child: Text("Register for event",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
