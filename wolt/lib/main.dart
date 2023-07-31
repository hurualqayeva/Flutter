import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(CarouselImages());

List<String> images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKt6cZExOPZ8u0MpYBxRFx4Lr0iPilze1oJw&usqp=CAU",
  "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2022/08/19/WU3203-ree-drummond-crispy-everything-chicken-cutlets_4x3.jpg.rend.hgtvcom.966.725.suffix/1660928170362.jpeg",
];

List<String> foodPhotos = [
  "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80",
"https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"
];


class CarouselImages extends StatelessWidget {
  CarouselImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Wolt',
              textAlign: TextAlign.center,
              style: GoogleFonts.kalam(
                textStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notification_add,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
        body: Column(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 200, // Height of the carousel
                autoPlay: true, // Auto-playing the carousel
                enlargeCenterPage: true, // Enlarge the centered image
                enableInfiniteScroll: true, // Infinite scrolling
                initialPage: 0, // Index of the initial image
                autoPlayInterval: Duration(seconds: 3), // Duration between auto-playing images
                autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
                autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Popular right now',
                     textAlign: TextAlign.right,
                    style: GoogleFonts.sansita(textStyle: TextStyle(fontSize: 30)),
                  ),
                ),
              ],
            ),
         Row(
          children: [
             Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodPhotos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          foodPhotos[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
          ],
         ),
          Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Late lunch near you',
                     textAlign: TextAlign.right,
                    style: GoogleFonts.sansita(textStyle: TextStyle(fontSize: 30)),
                  ),
                ),
              ],
            ),
         Row(
          children: [
             Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodPhotos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          foodPhotos[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
          ],
         )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[300], // Background color of the bottom navigation bar
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusts spacing between icons
            children: [
              Expanded(
                
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.star),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delivery_dining),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.takeout_dining),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.photo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
