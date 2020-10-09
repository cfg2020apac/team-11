import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => _StoriesPageState();
}

var storyList = [
  ["Alex Ho","4 Oct 2020","Tuition for primary school children","It was a great experience and I was glad to be part of this activity and grow as an individual!","https://image.shutterstock.com/image-photo/passport-photo-portrait-asian-smiling-260nw-1041841363.jpg"],
  ["John Tan","29 Sep 2020","Beach cleaning at East Coast Park","It was a great experience and I was glad to be part of this activity and grow as an individual!","https://images.unsplash.com/photo-1522602724102-7b966b111376?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"],
  ["Michael Lim","27 Sep 2020","Social media with elderly","It was a great experience and I was glad to be part of this activity and grow as an individuaaaaaal! It was a great experience and I was glad to be part of this activity and grow as an individuaaaaaal It was a great experience and I was glad to be part of this activity and grow as an individuaaaaaal","https://i.pinimg.com/236x/b2/0c/d2/b20cd2371badebe689d302429ed525d2.jpg"],
  ["Nicole Ong","18 Sep 2020","Food drive at Ang Mo Kio","It was a great experience and I was glad to be part of this activity and grow as an individual!","https://image.shutterstock.com/image-photo/passport-photo-portrait-asian-smiling-260nw-1041841363.jpg"],
  ["Valerie Ng","2 Sep 2020","Visit to Macritchie reservoir","It was a great experience and I was glad to be part of this activity and grow as an individual!","https://images.unsplash.com/photo-1522602724102-7b966b111376?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"],
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
    const boxSpace = SizedBox(height: 25);
    const boxWide = SizedBox(width: 12);
    const smallHeight = SizedBox(height: 5);
    const smallWide = SizedBox(width: 7);

    return Scaffold(
      appBar: AppBar(
        title: Text("Stories"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Share Your Experience!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Your experience...",
                    ),
                    maxLines: 3,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          child: Text("Upload Image(s)"),
                          onPressed: () {
                            // input = myController.text;
                          },
                        ),
                        smallWide,
                        RaisedButton(
                          child: Text("Post"),
                          onPressed: () {
                            input = myController.text;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          boxSpace,
          Container(
            // height: 40,
            child: Center(
              child: Text(
                "Participants' Stories!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    for (int index=0; index<storyList.length; index++)
                      Card(
                        elevation: 7,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: ExcludeSemantics(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(storyList[index][4]),
                                  // child: ImageIcon(
                                  //   NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/ThreeTimeAKCGoldWinnerPembrookeWelshCorgi.jpg/1200px-ThreeTimeAKCGoldWinnerPembrookeWelshCorgi.jpg"),
                                  //   size: 40,
                                  // ),
                                ),
                              ),
                              title: Text(storyList[index][2]),
                              subtitle: Text(storyList[index][0] + " on " +
                                  storyList[index][1]),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12),
                              alignment: Alignment.topLeft,
                              child: Text(
                                storyList[index][3],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            smallHeight,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Text(
                                    index.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Icon(Icons.image_outlined, color: Colors.teal,),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: likes[index] ? Icon(
                                    Icons.favorite_border,
                                    // color: Colors.grey,
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
                                Icon(
                                  Icons.comment_outlined,
                                ),
                                boxWide,
                                Icon(
                                  Icons.share,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
