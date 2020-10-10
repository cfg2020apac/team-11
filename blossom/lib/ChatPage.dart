import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> _messages = <ChatMessage>[
    new ChatMessage(
      text:
          "Hi there! This is a reminder that you have an event coming up in 3 days! The event you have successfully registered for is: #I Am Remarkable workshop for YOUth. Could you please confirm that you are attending the event? (Yes/No)",
      name: "Blossom",
      type: false,
    )
  ];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Chat with Blossom',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
    ChatMessage message;
    if (text == "Yes" || text == "yes") {
      message = new ChatMessage(
        text:
            "Awesome! Your status has been updated. We look forward to seeing you!",
        name: "Blossom",
        type: false,
      );
    } else if (text == "No" || text == "no") {
      message = new ChatMessage(
        text:
            "So sorry to hear that you can't join the event! Do look out for our other events. Hope to see you soon!",
        name: "Blossom",
        type: false,
      );
    } else if (text == "What are badges?") {
      message = new ChatMessage(
        text:
            "Badges are a way to show your friends what you are most passionate about! You can earn badges by volunteering in relevant projects. Head over to the main page to see your progress towards getting the badges as well as which volunteering events can help you achieve certain badges!",
        name: "Blossom",
        type: false,
      );
    } else {
      message = new ChatMessage(
        text: "Sorry, I did not understand that.",
        name: "Blossom",
        type: false,
      );
    }
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

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://thumbs.dreamstime.com/b/smiling-woman-vector-illustration-young-happy-student-happy-girl-adult-beauty-person-healthy-71801962.jpg'),
          backgroundColor: Colors.transparent,
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style:
                    new TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text, style: TextStyle(fontSize: 20)),
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
            new Text(this.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://www.straitstimes.com/sites/default/files/styles/medium/public/articles/2017/09/10/st_20170910_cyyoungashley_3408138.jpg?itok=2ZyC_nAZ'),
          backgroundColor: Colors.transparent,
        ),
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
