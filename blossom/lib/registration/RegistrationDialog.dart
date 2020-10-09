import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../HomePage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// import 'login.dart';

// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return FlutterEasyLoading(child: Text("Error"));
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//            return MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: MyHomePage(),
//           );
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return FlutterEasyLoading(child: Text("Please wait.."));
//       },
//     );
    
   
//   }
// }
class RegistrationDialog extends StatefulWidget {
  @override
  _RegistrationDialog createState() => _RegistrationDialog();
}

class _RegistrationDialog extends State<RegistrationDialog> {
  bool showProgress = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, password, name, race,mobileNum;
  DateTime dob;

  String _value = '';
    Future _selectDate() async {
      dob = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1997),
          lastDate: new DateTime(2022)
      );
      if(dob != null) setState(() => _value = DateFormat(' d MMM, yyyy ').format(dob));
    }
  CollectionReference fsUsers = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {

    

    return AlertDialog(
      title: Text("Start your journey with Blossom World Society!"),
      content: Center(
        child: ModalProgressHUD(
          inAsyncCall:showProgress ,
          child: SingleChildScrollView(
          padding : EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Registration Page",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                textAlign: TextAlign.center,
                // onChanged: (value) {
                //   password = value;
                // },
                validator : (value) {
                  if(value != password){
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Re-enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    errorMaxLines: 2
                        ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
             Row(
                children: <Widget>[
                  new Text(_value == "" ? "Select Date of Birth" : _value),
                  new SizedBox(
                      width: 4.0,
                  ),
                  new RaisedButton(onPressed: _selectDate, child: new Text('select date'),)
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  mobileNum = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter your mobile no.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton<String>(
                value: race,
                hint: Text("Select race"),
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.black
                ),
                underline: Container(
                  height: 2,
                  color: Colors.grey[500],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    race = newValue;
                  });
                },
                items: <String>['Chinese', 'Indian', 'Malay', 'Caucasian']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showProgress = true;
                    });
                    try {
                      final newuser =
                          await auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      fsUsers.add({
                        'name' : name,
                        'uid'  : auth.currentUser.uid,
                        'DOB' : dob,
                        'race' : race,
                        'email' : email,
                        'mobile' : mobileNum
                      });
                      if (newuser != null) {
                        print("user created");
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => HomePage()),
                        // );
                        Navigator.pop(context);
                      }

                      setState(() {
                            showProgress = false;
                      });
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              )
            ],
          )
          )
        ),
      ),
    );
  }
}