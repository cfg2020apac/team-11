import 'package:blossom/HomePageProgress.dart';
import 'package:blossom/QuotePopUp.dart';
import 'HomePageCategories.dart';
import 'HomePageEvents.dart';
import 'event_data.dart';
import 'package:flutter/material.dart';
import 'eventsPage/EventsPage.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:               Container(
        margin: const EdgeInsets.only(top: 20),
    child: Image.asset('images/Logo_transparent.png', fit: BoxFit.fitHeight),)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: EventItemsSearch());
                },
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 3),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    enabled: false),
              )
              ),
              SizedBox(height: 20),
              Text(
                "Category",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HomePageCategories(),
              SizedBox(height: 20),
              Text(
                "Progress",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HomePageProgress(),
              SizedBox(height: 20),
              Text(
                "Event List",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HomePageEvents()
            ],
          ),
        ),
      ),
      floatingActionButton: ValueButton()
    );
  }
}

class ValueButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ValueButton();
  }
}

class _ValueButton extends State<ValueButton> {
  List<String> valuesImg = [
    'images/Badge1.png',
    'images/Badge2.png',
    'images/Badge3.png',
    'images/Badge4.png'
  ];

  List<String> values = ['Gratitude', 'Kindness', 'Service', 'Sincerity'];
  int _index = 0;

  void _incrementCounter() async {
    var rng = new Random();
    await showDialog(
      context: context,
      builder: (BuildContext context) => QuotePopUp(
        title: values[_index],
        image: valuesImg[_index],
        description: quotes[_index][rng.nextInt(9)],
        buttonText: "Definitely!",
      ),
    );
    setState(() {
      _index = (_index + 1) % 4;
    });
  }



  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Inspirational Quotes',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(
              radius: 30,
              child: Image.asset(valuesImg[_index]),
            ),
          )
      );
  }
}

class EventItemsSearch extends SearchDelegate<EventItem> {
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //This should route to the event details page
    return Center(
        child: Text(
      query,
      style: TextStyle(fontSize: 20),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final eventList = query.isEmpty
        ? loadEventItem()
        : loadEventItem()
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return eventList.isEmpty
        ? Text("No Results Found...", style: TextStyle(fontSize: 20))
        : ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              //grabs a particular event
              final EventItem listItem = eventList[index];
              return ListTile(
                  onTap: () {
                    showResults(context);
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listItem.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        listItem.categoryName,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ));
            });
  }
}

List<List<String>> quotes = [gratitudeQuotes, kindnessQuotes, serviceQuotes, sincerityQuotes];

List<String> gratitudeQuotes = [
  '“At times, our own light goes out and is rekindled by a spark from another person. Each of us has cause to think with deep gratitude of those who have lighted the flame within us.” – Albert Schweitzer',
  '“Gratitude is the fairest blossom which springs from the soul.” – Henry Ward Beecher',
  '“Gratitude makes sense of our past, brings peace for today, and creates a vision for tomorrow.” – Melody Beattie',
  '“Happiness cannot be traveled to owned, earned, worn or consumed. Happiness is the spiritual experience of living every minute with love, grace, and gratitude.” – Denis Waitley',
  '“Joy is the simplest form of gratitude.” – Karl Barth',
  '“In ordinary life, we hardly realize that we receive a great deal more than we give, and that it is only with gratitude that life becomes rich.” – Dietrich Bonhoeffer',
  '“I would maintain that thanks are the highest form of thought, and that gratitude is happiness doubled by wonder.” – Gilbert C. Chesterton',
  '“Let us rise up and be thankful, for if we didn’t learn a lot today, at least we learned a little, and if we didn’t learn a little, at least we didn’t get sick, and if we got sick, at least we didn’t die; so, let us all be thankful.” – Buddha',
  '“Gratitude helps you to grow and expand; gratitude brings joy and laughter into your life and into the lives of all those around you.” – Eileen Caddy',
  '“I looked around and thought about my life. I felt grateful. I noticed every detail. That is the key to time travel. You can only move if you are actually in the moment. You have to be where you are to get where you need to go.” – Amy Poehler',
];
List<String> kindnessQuotes = [
  '“Sometimes it takes only one act of kindness and caring to change a person’s life.” – Jackie Chan',
  '“Do things for people not because of who they are or what they do in return, but because of who you are.” – Harold S. Kushner',
  '“Carry out a random act of kindness, with no expectation of reward, safe in the knowledge that one day someone might do the same for you.” – Princess Diana',
  '“Remember there’s no such thing as a small act of kindness. Every act creates a ripple with no logical end.” – Scott Adams',
  '“Because that’s what kindness is. It’s not doing something for someone else because they can’t, but because you can.” – Andrew Iskander',
  '“Kindness can become its own motive. We are made kind by being kind.” – Eric Hoffer',
  '“Love and kindness are never wasted. They always make a difference. They bless the one who receives them, and they bless you, the giver.” – Barbara De Angelis',
  '“A single act of kindness throws out roots in all directions, and the roots spring up and make new trees.” – Amelia Earhart',
  '“Unexpected kindness is the most powerful, least costly, and most underrated agent of human change.” – Bob Kerrey',
  '“Constant kindness can accomplish much. As the sun makes ice melt, kindness causes misunderstanding, mistrust, and hostility to evaporate.” – Albert Schweitzer',
];
List<String> serviceQuotes = [
  '“As we lose ourselves in the service of others we discover our own lives and our own happiness.” - Dieter F. Uchtdorf',
  '“Small acts, when multiplied by millions of people, can transform the world.” - Howard Zinn',
  '“Always render more and better service than is expected of you, no matter what your task may be.” - Og Mandino',
  '“Don’t feel bad if people remember you only when they need you. Feel privileged that you are like a candle that comes to their mind when there is darkness.” - Anonymous',
  '“Life’s most persistent and urgent question is: What are you doing for others?” - Martin Luther King',
  '“To give real service, you must add something which cannot be bought or measures with money.” - Douglas Adams',
  '“Do some selfless service for people who are in need. Consider the whole picture, not just our little selves.” - Nina Hagen',
  '“Do your little bit of good where you are; its those little bits of good put together that overwhelm the world.” - Desmond Tutu',
  '“Love means to serve and to serve means to please.” - Radhanath Swami',
  '“Replace selfish striving with selfless service.” - ATGW',
];
List<String> sincerityQuotes = [
  '"Sincerity makes the very least person to be of more value than the most talented hypocrite." - Charles Spurgeon',
  '"Sincerity and truth are the basis of every virtue." - Confucius',
  '"When you fall in love, the natural thing to do is give yourself to it. That\'s what I think. It\'s just a form of sincerity." - Haruki Murakami',
  '"Insincerity is always weakness; sincerity even in error is strength." - George Henry Lewes',
  '"Sincerity increases willingness to care." - Toba Beta',
  '"Sincerity is impossible unless it pervades the whole being, and the pretense of it saps the very foundation of character." - James Russell Lowell',
  '"Sincerity is an openness of heart; we find it in very few people; what we usually see is only an artful dissimulation to win the confidence of others." - La Rochefoucauld',
  '"There is no substitute for thoroughgoing, ardent and sincere earnestness." - Charles Dickens',
  '"Sincerity is the highest complement you can pay." - Ralph Waldo Emerson',
  '"The great enemy of clear language is insincerity. When there is a gap between one’s real and one’s declared aims, one turns, as it were, instinctively to long words and exhausted idioms, like a cuttlefish squirting out ink." - George Orwell',
];