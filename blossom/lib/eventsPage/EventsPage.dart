import 'package:flutter/material.dart';
import 'components/Gallery.dart';
import 'package:intl/intl.dart';
import 'components/PointerDetails.dart';
import 'components/RegisterButton.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime eventTime = DateTime.now();
    DateTime trainingTime = DateTime.now();
    String eventTimeString = DateFormat('EEE, d MMM, yy   kk:mm a').format(eventTime);
    String ageRequirement = "10-12";
    String trainingTimeString = DateFormat('EEE, d MMM, yy   kk:mm a').format(trainingTime);
    String eventDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
    // String eventTimeString = DateFormat.yMMMMd().add_jm().format(eventTime);
    double kDefaultPaddin = 10;
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Gallery(size : size),
            Container(
              // margin: EdgeInsets.only(top: size.height * 0.01),
              padding: EdgeInsets.only(
                top: kDefaultPaddin * 2,
                left: kDefaultPaddin,
                right: kDefaultPaddin,
              ),
              height: 800,
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
              ),
              child : new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                  SizedBox(
                  width : size.width, 
                  child : Padding(
                      child :Text(
                        // Event Title
                        "Discovering Treasure Through Stories",
                        style: TextStyle(
                            fontWeight : FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "Open_Sans",
                            color: Color(0xFF000000)
                          )
                        ),
                        padding :  EdgeInsets.only(
                          left: kDefaultPaddin,
                          right: kDefaultPaddin,
                          bottom : kDefaultPaddin * 2,
                        ),
                      )
                  ),

                  SizedBox(
                    width: size.width,
                    child : Padding(
                      padding : EdgeInsets.only(
                          left: kDefaultPaddin,
                          right: kDefaultPaddin,
                          bottom : kDefaultPaddin*2
                        ),
                      child : Text(eventTimeString,
                        style : TextStyle(
                          fontFamily: "Open_Sans",
                          fontSize : 20,
                          color : Colors.grey[800],
                          fontWeight : FontWeight.normal,
                        )
                          
                      )
                    )
                  ),

                  PointerDetails(keyString: "Age Requirements", valueString : ageRequirement),
                  PointerDetails(keyString: "Training Session", valueString : trainingTimeString),
                  

                  SizedBox(
                    width: size.width,
                    child : Padding(
                      padding : EdgeInsets.only(
                          top : kDefaultPaddin*2,
                          left: kDefaultPaddin,
                          right: kDefaultPaddin,
                          bottom : kDefaultPaddin*2
                        ),
                      child : Text(eventDescription,
                        style : TextStyle(
                          fontFamily: "Open_Sans",
                          fontSize : 14,
                          color : Colors.grey[800],
                          fontWeight : FontWeight.normal,
                        )
                          
                      )
                    )
                  ),

                  RegisterButton()

                ]
              )
            ),
          ],
        ),
    //       )
    //     ],
    //   ),
    );
  }
}
