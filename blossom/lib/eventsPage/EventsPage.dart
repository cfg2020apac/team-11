import 'package:flutter/material.dart';
import 'components/Gallery.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double kDefaultPaddin = 0.1;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Gallery(size : size),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  

                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child : new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children : [
                      Text(
                        // Event Title
                        "Discovering Treasure Through Stories",
                        style: TextStyle(
                          fontWeight : FontWeight.bold
                        ),
                      ),
                    ]
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
