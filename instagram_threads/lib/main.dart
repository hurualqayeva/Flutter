import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            iconSize: 28,
            onPressed: () => {},
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              iconSize: 28,
              onPressed: () => {},
              icon: const FaIcon(FontAwesomeIcons.instagram),
              color: Colors.black,
            ),
            IconButton(
              iconSize: 28,
              onPressed: () => {},
              icon: const FaIcon(FontAwesomeIcons.ellipsis),
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.britannica.com/99/236599-050-1199AD2C/Mark-Zuckerberg-2019.jpg"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 100,
                      width: 2,
                      child: ColoredBox(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("zuck",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    SizedBox(
                      height: 150,
                      width: 300,
                      child: Text(
                        maxLines: 15,
                        overflow: TextOverflow.clip,
                        "Threads reached 100 million sign ups over the weekend. That's mostly organic demand and we haven't even turned on many promotions yet. Can't believe it's only been 5 days!",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Transform.scale(
                          scaleX: -1,
                          child: FaIcon(
                            FontAwesomeIcons.comment,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        FaIcon(
                            FontAwesomeIcons.retweet,
                            color: Colors.black,
                          ),
                        SizedBox(
                          width: 6,
                        ),
                        FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ],
                )
              ],
            ),SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.britannica.com/99/236599-050-1199AD2C/Mark-Zuckerberg-2019.jpg"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 100,
                      width: 2,
                      child: ColoredBox(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("zuck",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    SizedBox(
                      height: 150,
                      width: 300,
                      child: Text(
                        maxLines: 15,
                        overflow: TextOverflow.clip,
                        "Threads reached 100 million sign ups over the weekend. That's mostly organic demand and we haven't even turned on many promotions yet. Can't believe it's only been 5 days!",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Transform.scale(
                          scaleX: -1,
                          child: FaIcon(
                            FontAwesomeIcons.comment,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        FaIcon(
                            FontAwesomeIcons.retweet,
                            color: Colors.black,
                          ),
                        SizedBox(
                          width: 6,
                        ),
                        FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.search,
                color: Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.edit,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.black,
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}