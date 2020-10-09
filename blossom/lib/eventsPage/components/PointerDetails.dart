import 'package:flutter/material.dart';

class PointerDetails extends StatelessWidget {
  final String keyString;
  final String valueString;

  PointerDetails({this.keyString, this.valueString});

  final int maxKeyLength = 20;
  

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    String displayString1 = keyString + " "*(maxKeyLength-keyString.length) ;
    String displayString2 = ":" + " "*4 + valueString;
    double kDefaultPaddin = 10;
    return
     SizedBox(
      child : Padding(
        padding : EdgeInsets.only(
            left: kDefaultPaddin,
            right: kDefaultPaddin,
          ),
        child : RichText(
          
          text : TextSpan(
              text : displayString1,
              style : TextStyle(
                fontFamily: "Open_Sans",
                fontSize : 14,
                color : Colors.black,
                fontWeight : FontWeight.bold,
              ),
              children : [
                TextSpan(
                  text: displayString2,
                  style: TextStyle(
                    fontFamily: "Open_Sans",
                    fontSize : 14,
                    color : Colors.grey[800],
                    fontWeight : FontWeight.normal,
                  ),
                )
              ]

          )
            
        )
      )
    );

  }
}