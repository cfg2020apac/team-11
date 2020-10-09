import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {


  RegisterButton();
  

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    
    return SizedBox(
      width : 200,
      child : RaisedButton(
      onPressed: () => {
       null
      },
      color : Colors.blue[500],
      child : new Text("Register for this event",
      style : TextStyle(
                          fontFamily: "Open_Sans",
                          fontSize : 14,
                          color : Colors.white,
                          fontWeight : FontWeight.normal,
                        )
      )
    )
    
    )
    ;
  }
}