import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("About"),
      ),
      body: SingleChildScrollView (
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
              Container(margin: new EdgeInsets.all(15.0), child: Text('FAQs',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              new Container(
                height: MediaQuery.of(context).size.height / 2,
                child: new ListView.builder(
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
              Container(margin: new EdgeInsets.all(15.0), child: Text('Contact Us',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Container(child: Text('Tel: (65)6464 5116')),
              Container(child: Text('WhatsApp: (65) 8313 1544')),
              Container(child: Text('Email: contactus@blossomworld.sg')),
              Container(margin: new EdgeInsets.all(15.0), child: MyCustomForm()),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewPage,
        tooltip: 'Chat with Blossom',
        child: Icon(Icons.chat),
      ),
    );
    ;
  }

  // chat page
  void _openNewPage() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new ChatBot();
        },
      ),
    );
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

class ChatBot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatBot();
  }
}

class _ChatBot extends State<ChatBot> {
  final List<ChatMessage> _messages = <ChatMessage>[new ChatMessage(
    text: "Hi! My name is Blossom, your app companion. How may I help you?",
    name: "Blossom",
    type: false,
  )];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Chat with Blossom'),
      ),
      body: new Column(children: <Widget>[
        new Container(
          child: _buildChatBody(),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }


  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
  }

  void response(text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: "Badges are a way to show your friends what you are most passionate about! You can earn badges by volunteering in relevant projects. Head over to the main page to see your progress towards getting the badges as well as which volunteering events can help you achieve certain badges!",
      name: "Blossom",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildChatBody() {
    return new Flexible(
        child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        ));
  }


  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}

class Faq {
  final String question;
  List<String> answers;

  Faq(this.question, this.answers);
}

var contact = new Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('Tel: (65)6464 5116'),
      ),
    ),
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('Whatsapp: (65) 8313 1544'),
      ),
    ),
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('Email: contactus@blossomworld.sg'),
      ),
    ),
  ],
);

List<Faq> faqs = [
  new Faq(
      'Who is Blossom World Society?',
      ['Established since 2008, Blossom World Society (BWS) is dedicated to providing a positive environment for our younger generation to grow and develop with good moral values and character. Our goal is to inspire a gracious generation that contributes positively to family, society and country. We firmly believe that one who is filial, will also be empathetic and grateful towards others. We bring together younger generation of all races and religions in Singapore who are keen to volunteer their services for the underprivileged.']
  ),
  new Faq(
      'Who is Blossom World Society?',
      ['Established since 2008, Blossom World Society (BWS) is dedicated to providing a positive environment for our younger generation to grow and develop with good moral values and character. Our goal is to inspire a gracious generation that contributes positively to family, society and country. We firmly believe that one who is filial, will also be empathetic and grateful towards others. We bring together younger generation of all races and religions in Singapore who are keen to volunteer their services for the underprivileged. In the course of having youths plan and run BWS\'s voluntary services, we also nurture and develop leadership qualities in the younger generation for them to be able to contribute back to community service and charitable activities.']
  ),
  new Faq(
      'How to I become a volunteer?',
      ['All volunteers with BWS are required to have a registered account with the BWS mobile application. However, feel free to browse the project listings as a guest. If a project interests you and you fulfil the criteria, click Register on the project details page and a BWS staff member will be in contact with you shortly to confirm your participation. You can view your application process in your profile page!']
  ),
  new Faq(
      'What are badges?',
      ['Badges are special achievements you can earn by participated in various projects. There are four types of badges - Sincerity, Gratitude, Service, and Kindness - representing the four core values of BWS!',]
  ),
  new Faq(
      'How to I become a volunteer?',
      ['All volunteers with BWS are required to have a registered account with the BWS mobile application. However, feel free to browse the project listings as a guest. If a project interests you and you fulfil the criteria, click Register on the project details page and a BWS staff member will be in contact with you shortly to confirm your participation. You can view your application process in your profile page!']
  ),
  new Faq(
      'What are badges?',
      ['Badges are special achievements you can earn by participated in various projects. There are four types of badges - Sincerity, Gratitude, Service, and Kindness - representing the four core values of BWS!',]
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
    // Build a Form widget using the _formKey we created above

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
              child: Column(
                children: [
                  Text('General Enquiries',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "First Name", labelText: "First Name"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Last Name", labelText: "Last Name"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enquiry", labelText: "Enquiry"),
                    maxLines: 4,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if

                        // the form is invalid.

                        if (_formKey.currentState.validate()) {
                          // If the form is valid, we want to show a Snackbar

                          Scaffold.of(context)
                              .showSnackBar(SnackBar(
                            content: Text('We have received your inquiry! We will get back to you shortly within 3 working days. You may also try chatting with our cyber-assistant Blossom to see if she can help with your enquiry!'),
                          ))
                              .closed
                              .then((SnackBarClosedReason reason) {
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

bool isNumeric(String s) {
  try {
    return double.parse(s) != null;
  } catch (e) {
    return false;
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(child: new Text('B')),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name, style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            child: new Text(
              this.name[0],
              style: new TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}

