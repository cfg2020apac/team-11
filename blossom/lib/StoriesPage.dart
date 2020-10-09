import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => _StoriesPageState();
}

var storyList = [
  ["Alex Ho","4 Oct 2020","Tuition for primary school children","It was a great experience and I was glad to be part of this activity and grow as an individual!"],
  ["John Tan","29 Sep 2020","Beach cleaning at East Coast Park","It was a great experience and I was glad to be part of this activity and grow as an individual!"],
  ["Michael Lim","27 Sep 2020","Social media with elderly","It was a great experience and I was glad to be part of this activity and grow as an individuaaaaaal! It was a great experience and I was glad to be part of this activity and grow as an individuaaaaaal It was a great experience and I was glad to be part of this activity and grow as an individuaaaaaal"],
  ["Nicole Ong","18 Sep 2020","Food drive at Ang Mo Kio","It was a great experience and I was glad to be part of this activity and grow as an individual!"],
  ["Valerie Ng","2 Sep 2020","Visit to Macritchie reservoir","It was a great experience and I was glad to be part of this activity and grow as an individual!"],
];

String input;

List<bool> likes = List.filled(storyList.length, true);

class _StoriesPageState extends State<StoriesPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const boxSpace = SizedBox(height: 15);

    return Scaffold(
      appBar: AppBar(
        title: Text("Stories"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  child: Center(
                    child: Text("Share Your Experience!"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ),
                Center(
                  child: RaisedButton(
                    child: Text("Post"),
                    onPressed: () {
                      input = myController.text;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Center(
              child: Text("Participants' Stories!"),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: <Widget>[
                  for (int index=0; index<storyList.length; index++)
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: ExcludeSemantics(
                            child: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                          ),
                          title: Text(storyList[index][2]),
                          subtitle: Text(storyList[index][0]+" on "+storyList[index][1]),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.topLeft,
                            child: Text(storyList[index][3]),
                        ),
                        Center(
                          child: IconButton(
                            icon: likes[index] ? Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ) : Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                likes[index] = !likes[index];
                              });
                            },
                          ),
                        ),
                        boxSpace,
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
