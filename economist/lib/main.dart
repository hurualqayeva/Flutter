import 'package:economist/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: MyCardList(),
        bottomNavigationBar: MyBottomNavigationBar(), 
      ),
    );
  }
}

class MyCardList extends StatelessWidget {
  final List<CardData> cardData = [
    CardData(
      title: 'The Intelligence',
      description: ["The Intelligence is a current-affairs show, published every weekday by Economist Podcasts. Each episode brings our expert analysis to three stories, from the biggest global events to those that often go under-reported. "],
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk_-ijCcJnTbCBRYpy_Ls9C_EGX6Ouhrgxb7l-lNMZRfY_EK2MSc86xllemCHJXp1IN9o&usqp=CAU',
    ),
    CardData(
      title: 'Babbage',
      description: ['Named after Charles Babbage, a 19th-century polymath and grandfather of computing, Babbage is a weekly podcast on science and technology.'],
      imageUrl: 'https://assets.pippa.io/shows/62e286a934d4d9fe5e874247/show-cover.jpg',
    ),
    CardData(
      title: 'Drum Tower',
      description: ["For almost seven centuries the beats of China’s most famous drum tower, or gulou, kept people in Beijing to time. Two of The Economist’s China correspondents, Alice Su and David Rennie, examine the way China is changing from within as well as its shifting influence beyond its borders."],
      imageUrl: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts126/v4/08/08/a3/0808a383-f4ae-e129-12dd-e47b34ba5656/mza_1936743925667765176.jpeg/1200x1200bb.jpg',
    ),
    CardData(
      title: "Editor's picks",
      description: ["A must-read selection of articles from this week's issue of The Economist, straight from the desk of Zanny Minton Beddoes."],
      imageUrl: 'https://i.scdn.co/image/ab67656300005f1ffb838b2c3fcdd1563d324be4',
    ),
    CardData(
      title: 'The Economist asks',
      description: ["One question posed to a high-profile newsmaker, followed up with lively debate. Anne McElvoy hosts The Economist's chat show. Published every Thursday on Economist Radio."],
      imageUrl: 'https://cdns-images.dzcdn.net/images/talk/5ddd71401570956d191736412c34ab17/1000x1000.jpg',
    ),
    CardData(
      title: 'GameChangers',
      description: ["It might start with a lightbulb moment or a sudden flash of insight—but having an idea and making a success of it are very different things. It’s the gap between invention and innovation. In these six episodes, you’ll find out about the people and stories behind game-changing ideas and technology.Hosted on Acast. See  for more information."],
      imageUrl: 'https://thumborcdn.acast.com/Z_Uuu9d4K5aKU7wik5A4pIxc6U0=/1500x1500/https://mediacdn.acast.com/assets/bb7c5a84-b3ab-4912-950b-ded7a7f6fc17/-kq6oh8jc-gamechangers_square_1400.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: Text(
            'Ordered by latest episodes',
            style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              return CardWithDescription(
                cardData: cardData[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class CardWithDescription extends StatelessWidget {
  final CardData cardData;

  const CardWithDescription({
    Key? key,
    required this.cardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              cardData.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                cardData.title,
                 style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
              ),
              SizedBox(height: 3.0),
              for (String line in cardData.description)
                Text(
                   
                  line,
                  maxLines: 3, // Limit to 3 lines
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardData {
  final String title;
  final List<String> description;
  final String imageUrl;

  CardData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar();
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Podcasts',
          style: GoogleFonts.ibmPlexSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
     Text('Home screen'),
    Text('Search Screen'),
    MyCardList(),
    Text('Notifications Screen'),
    SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

