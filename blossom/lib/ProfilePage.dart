import 'package:flutter/material.dart';

import 'package:blossom/model/Profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = new Profile("Bobby", "5");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[ProfileHeader(profile:profile), Container(height:20), Badges(), HistoryEvents() ])
    );
  }
}

class HistoryEvents extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget> [Text("Events Volunteered:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ],
          ),
          Container(height:10),
          Row(
            children: <Widget> [Text("Lorem ipsum"),
            ],
          ),
          Row(
            children: <Widget> [Text("Lorem ipsum"),
            ],
          ),
          Row(
            children: <Widget> [Text("Lorem ipsum"),
            ],
          ),
          Container(height:30),
          Container(
            width: 250.00,

            child: RaisedButton(
                onPressed: () => {
                  //TODO do pdf
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 250.00, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text("Generate CIP hours",
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),
          ),

    ]
    )
    );
  }

}

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget> [Text("Badges Collected:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20))],
          ),
          Row(
            children: <Widget>[
                  Image.asset('images/Badge1.png',
                      height: 50,
                      width: 50),
                  Container(width:5),
                  Image.asset('images/Badge2.png',
                      height: 50,
                      width: 50),
                  Container(width:5),
                  Image.asset('images/Badge3.png',
                      height: 50,
                      width: 50),
                  Container(width:5),
                  Image.asset('images/Badge4.png',
                      height: 50,
                      width: 50),],
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
              child: Column (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                    backgroundImage: NetworkImage(
                      profile.imageUrl,
              ), radius :50.0),
                    Container (
                      height:10
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        profile.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                      ),
                    ),
                  ]
              )
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Events volunteered"),
                    Container (
                        height:10
                    ),
                    Text(
                      profile.noOfcompletedEvents,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )

                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Events upcoming"),
                    Container (
                        height:10
                    ),
                    Text(
                      profile.noOfUpComingEvents,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
