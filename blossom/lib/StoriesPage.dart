import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => _StoriesPageState();
}

var storyList = [
  [
    "Alex Ho",
    "4 Oct 2020",
    "Tuition for primary school children",
    "It was a great experience and I was glad to be part of this activity and grow as an individual!",
    "https://image.shutterstock.com/image-photo/passport-photo-portrait-asian-smiling-260nw-1041841363.jpg"
  ],
  [
    "John Tan",
    "29 Sep 2020",
    "Beach cleaning at East Coast Park",
    "The beach cleaning activity opened my eyes to the extent of plastic pollution into our oceans. Having seen the situation with the plastic waste at sea, I feel that it is important that every individual play his part to reduce plastic waste that is poisoning our oceans. Although the beach cleaning activity was physically quite draining, I was glad to have contributed my small part towards the effort to clean our oceans and would definitely take part in more beach cleaning in future!",
    "https://images.unsplash.com/photo-1522602724102-7b966b111376?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"
  ],
  [
    "Michael Lim",
    "27 Sep 2020",
    "Social media with elderly",
    "Social media applications may be something simple and intuitive for most of us teenagers to use, but for the elderly, it is a totally foreign topic. Through the activity, I got to engage myself with an elderly in a one-to-one session to impart the basics of using Instagram and Facebook. It is important for us to bridge the technology gap between ourselves and the older generation for them to stay up to speed with current technology as well as provide an avenue for them to have more common topics for interaction with their children and grandchildren.",
    "https://i.pinimg.com/236x/b2/0c/d2/b20cd2371badebe689d302429ed525d2.jpg"
  ],
  [
    "Nicole Ong",
    "18 Sep 2020",
    "Food drive at Ang Mo Kio",
    "The food drive was a very eventful activity where I got to distribute essential food supplies to the under-privileged group of citizens residing in the And Mo Kio area. The smiles on the residents faces really made my day and reminded me of the importance to cherish what I have.",
    "https://image.shutterstock.com/image-photo/passport-photo-portrait-asian-smiling-260nw-1041841363.jpg"
  ],
  [
    "Valerie Ng",
    "2 Sep 2020",
    "Visit to Macritchie reservoir",
    "The visit to Macritchie reservoir was a fun filled morning where I got to interact with some elderly and enjoy the fresh air and outdoors. It was a great opportunity for interaction with the elderly and listen to them share their stories!",
    "https://images.unsplash.com/photo-1522602724102-7b966b111376?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"
  ],
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
        title: Text(
          "Stories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
                    for (int index = 0; index < storyList.length; index++)
                      Card(
                        elevation: 7,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: ExcludeSemantics(
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(storyList[index][4]),
                                  // child: ImageIcon(
                                  //   NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/ThreeTimeAKCGoldWinnerPembrookeWelshCorgi.jpg/1200px-ThreeTimeAKCGoldWinnerPembrookeWelshCorgi.jpg"),
                                  //   size: 40,
                                  // ),
                                ),
                              ),
                              title: Text(storyList[index][2]),
                              subtitle: Text(storyList[index][0] +
                                  " on " +
                                  storyList[index][1]),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                                  Icon(
                                    Icons.image_outlined,
                                    color: Colors.teal,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: likes[index]
                                      ? Icon(
                                          Icons.favorite_border,
                                          // color: Colors.grey,
                                        )
                                      : Icon(
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
