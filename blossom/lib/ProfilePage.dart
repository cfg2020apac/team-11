import 'package:flutter/material.dart';

import 'package:blossom/model/Profile.dart';
import 'package:blossom/CipHoursPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

//will change document id to be fetched for authentication
class _ProfilePageState extends State<ProfilePage> {
  final String documentId = "Ylh91a6r8hWNhpRwmjLu";

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          Profile profile = new Profile(
              data["FullName"],
              data['NoOfcompletedEvents'],
              data['NoOfUpcomingEvents'],
              data["CompletedEvents"].cast<String>(),
              data["imageUrl"]);
          return Scaffold(
              body: ListView(children: <Widget>[
            ProfileHeader(profile: profile),
            Container(height: 20),
            Badges(),
            HistoryEvents(profile: profile)
          ]));
        }

        return Text("loading");
      },
    );
  }
}

class HistoryEvents extends StatelessWidget {
  Profile profile;
  List<String> completedEventName;
  HistoryEvents({
    this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: <Widget>[
          SizedBox(height: 10),
          Text("Events Volunteered:",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  profile.completedEvents[0],
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  profile.completedEvents[1],
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(height: 30),
          Container(
            width: 250.00,
            child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () => {reportView(context)},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Text(
                  "Generate CIP hours",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                )),
          ),
        ]));
  }
}

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Badges Collected:",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://3.bp.blogspot.com/_jguUYhL0gEg/TJx5BexXFKI/AAAAAAAAGpA/77uWXV-VWS8/s1600/Stock+vector+-+Helpful+hands+1.png"),
                  )),
              Container(width: 5),
              CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/proxy/iqEVu3eEEzuNo2DN99DtanjTfzB92DnmDCzOVq_LphBAp_oEZcLghneTM7gWxaKrksxQxnWQkqRuP1gfVCFl9A0Ma7Ld9e4"),
                  )),
              Container(width: 5),
              CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn2.iconfinder.com/data/icons/love-and-valentine-1-5/65/23-512.png"),
                  )),
              Container(width: 5),
              CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn2.iconfinder.com/data/icons/love-and-valentine-1-5/65/23-512.png"),
                  )),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  Profile profile;
  ProfileHeader({
    this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  CircleAvatar(
                      backgroundImage: NetworkImage(
                        profile.imageUrl,
                      ),
                      radius: 50.0),
                  Container(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      profile.name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                  ),
                ])),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Events volunteered"),
                    Container(height: 10),
                    Text(
                      profile.noOfcompletedEvents,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Events upcoming"),
                    Container(height: 10),
                    Text(
                      profile.noOfUpComingEvents,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
