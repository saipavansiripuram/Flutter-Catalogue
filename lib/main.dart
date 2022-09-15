import 'package:flutter/material.dart';
import 'notification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.light,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------------children 1
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Hey What You ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36.0)),
                    ),
                    Container(
                      child: Text("you like to eat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36.0)),
                    ),
                  ],
                ),
                //---------------------children 2
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => NotificationPage()));
                  },
                  child: Icon(
                    Icons.notifications_none,
                    size: 32.0,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Frequently bought foods",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                ),
                Container(
                  child: Text("View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.orange)),
                ),
              ],
            ),
          ),
          foodcard(
              context,
              "Dosa",
              40,
              "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/10/9/DV3016_masala-dosa_s4x3.jpg.rend.hgtvcom.826.620.suffix/1570635680579.jpeg",
              6),
          SizedBox(
            height: 20.0,
          ),
          foodcard(
              context,
              "Idly",
              40,
              "https://www.kannammacooks.com/wp-content/uploads/soft-idli-batter-recipe-using-idli-rava-mixie-blender-method.jpg",
              5),
          SizedBox(
            height: 20.0,
          ),
          foodcard(
              context,
              "Chicken Biryani",
              250,
              "https://www.awesomecuisine.com/wp-content/uploads/2007/10/Chicken-Biryani_resized.jpg", 
              8),
          SizedBox(
            height: 20.0,
          ),
          foodcard(
              context,
              "Paneer",
              150,
              "https://spicecravings.com/wp-content/uploads/2017/09/Paneer-Makhani-2-copy.jpg",
              5),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), icon: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), icon: Text("Orders")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("Favourite")),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text("Profile")),
          ]),
    );
  }
}

Widget foodcard(BuildContext context, String foodname, int amount, String url,
    int discount) {
  return Container(
    height: 200.0,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0)),
    margin: EdgeInsets.symmetric(horizontal: 16.0),
    child: Stack(
      children: [
        Positioned(
            right: 0.0,
            top: 10.0,
            child: Container(
              padding: EdgeInsets.all(4.0),
              width: 60.0,
              height: 30.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0))),
              child: Center(
                child: Text(discount.toString() + "% Off",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ),
            )),
        Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.black12],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                  //  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0))),
              width: MediaQuery.of(context).size.width - 32.0,
              height: 50.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodname,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16.0, color: Colors.yellow),
                          Icon(Icons.star, size: 16.0, color: Colors.yellow),
                          Icon(Icons.star, size: 16.0, color: Colors.yellow),
                          Icon(Icons.star, size: 16.0, color: Colors.yellow),
                          Icon(Icons.star, size: 16.0, color: Colors.white),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "₹ " + amount.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ],
              ),
            )),
      ],
    ),
  );
}
