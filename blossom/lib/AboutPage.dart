import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Container(margin: new EdgeInsets.all(15.0), child: Text('FAQs')),
            new Expanded(child: new ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, i) {
                return new ExpansionTile(
                  title: new Text(faqs[i].question),
                  children: <Widget>[
                    new Column(
                      children: _buildExpandableContent(faqs[i]),
                    ),
                  ],
                );
              },
            ),
            ),
            Container(margin: new EdgeInsets.all(15.0), child: Text('Contact Us')),
            Container(margin: new EdgeInsets.all(15.0), child: MyCustomForm()),
          ]
      ),

      // body: new ListView.builder(
      //   itemCount: faqs.length,
      //   itemBuilder: (context, i) {
      //     return new ExpansionTile(
      //       title: new Text(faqs[i].question, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
      //       children: <Widget>[
      //         new Column(
      //           children: _buildExpandableContent(faqs[i]),
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
    ;
  }

  _buildExpandableContent(Faq faq) {
    List<Widget> columnContent = [];

    for (String content in faq.answers)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0),),
        ),
      );

    return columnContent;
  }
}


class Faq {
  final String question;
  List<String> answers;

  Faq(this.question, this.answers);
}

List<Faq> faqs = [
  new Faq(
      'Who is Blossom World Society?',
      ['Established since 2008, Blossom World Society (BWS) is dedicated to providing a positive environment for our younger generation to grow and develop with good moral values and character. Our goal is to inspire a gracious generation that contributes positively to family, society and country. We firmly believe that one who is filial, will also be empathetic and grateful towards others. We bring together younger generation of all races and religions in Singapore who are keen to volunteer their services for the underprivileged. In the course of having youths plan and run BWS\'s voluntary services, we also nurture and develop leadership qualities in the younger generation for them to be able to contribute back to community service and charitable activities.']
  ),
  new Faq(
    'What is BWS\'s mission?',
    ['A vibrant Society dedicated to promoting the understanding of different cultures and to instill a sense of graciousness in the younger generation',]
  ),
  new Faq(
      'Who is Blossom World Society?',
      ['Established since 2008, Blossom World Society (BWS) is dedicated to providing a positive environment for our younger generation to grow and develop with good moral values and character. Our goal is to inspire a gracious generation that contributes positively to family, society and country. We firmly believe that one who is filial, will also be empathetic and grateful towards others. We bring together younger generation of all races and religions in Singapore who are keen to volunteer their services for the underprivileged. In the course of having youths plan and run BWS\'s voluntary services, we also nurture and develop leadership qualities in the younger generation for them to be able to contribute back to community service and charitable activities.']
  ),
  new Faq(
      'What is BWS\'s mission?',
      ['A vibrant Society dedicated to promoting the understanding of different cultures and to instill a sense of graciousness in the younger generation',]
  ),
];

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text.';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Enquiry submitted! You will hear back from us shortly.')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

