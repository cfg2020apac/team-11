import 'package:blossom/HomePage.dart';
import 'package:blossom/registration/RegistrationDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool checkCompleted;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime eventTime = widget.msg['date'].toDate();
    DateTime trainingTime = widget.msg['date'].toDate();
    String eventTimeString =
        DateFormat('EEE, d MMM, yy   kk:mm a').format(eventTime);
    String ageRequirement = "10-12";
    String trainingTimeString =
        DateFormat(' d MMM, yy   kk:mm a').format(trainingTime);
    String eventDescription = widget.msg['description'];
    checkCompleted = false;

    if (FirebaseAuth.instance.currentUser != null)
      FirebaseFirestore.instance.collection('users')
                              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
                              .get()
                              .then((QuerySnapshot querySnapshot) => {
                                  querySnapshot.docs.forEach((doc) {
                                      print(doc);
                                      doc["completed_events"].forEach((eventName) {
                                          print(eventName);
                                          print(widget.msg['name']);
                                        if(widget.msg['name'] == eventName)
                                          checkCompleted = true;
                                      });
                                  })
                              });
    
    String registeredDisplayButton = "Register for this event";
    if(checkCompleted) registeredDisplayButton = "Registered";

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
                  Text(widget.msg['name'],
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Divider(),
                  SizedBox(height: 10),
                  Row(children: [
                    Image.asset(
                      'images/date_icon.png',
                      scale: 2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(eventTimeString, style: TextStyle(fontSize: 20))
                  ]),
                  SizedBox(height: 10),
                  Text('Age Requirement: ' + ageRequirement,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Training Session: ' + trainingTimeString,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              color: checkCompleted? Colors.grey[400] : Colors.blueAccent,
              onPressed: () async{
                final FirebaseAuth auth = FirebaseAuth.instance;
                User authUser =  auth.currentUser;
                print(checkCompleted);
               

                if (authUser==null){
                // if(true){
                  showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return  RegistrationDialog();
                    }
                  );
                }

                else{
                  print("set to true");
                  checkCompleted = true;
                }

                print("Rerouting");

                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage()),
                );

                


              },
              child: Center(
                child: Text(FirebaseAuth.instance.currentUser == null ? "Log in / Register" : registeredDisplayButton,
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
