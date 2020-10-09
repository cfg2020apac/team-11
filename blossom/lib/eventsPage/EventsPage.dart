import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double kDefaultPaddin = 0.5;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
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
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(24),
                    //   topRight: Radius.circular(24),
                    // ),
                  )
                ),
                //ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
