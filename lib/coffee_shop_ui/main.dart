import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.only(left: 15.0),
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome, Tanya",
              style: TextStyle(
                  fontFamily: 'valera',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF473D3A)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/coffee_shop/model.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(right: 45.0),
          child: Container(
            child: Text(
              "Let/s select the best taste for your next coffee break!",
              style: TextStyle(
                fontFamily: 'nunito',
                fontSize: 17.0,
                fontWeight: FontWeight.w300,
                color: Color(0xFFB0AAA7),
              ),
            ),
          ),
        ),
        SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Taste of the week",
              style: TextStyle(
                fontFamily: 'valera',
                fontSize: 17.0,
                color: Color(0xFF473D3A),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                'See all',
                style: TextStyle(
                  fontFamily: 'valera',
                  fontSize: 15.0,
                  color: Color(0xFFCEC7C4),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        Container(
          height: 410.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _coffeeListCard(
                  'assets/coffee_shop/starbucks.png',
                  "Caffe Misto",
                  'Cofeeshop',
                  'Our dark, rich espresso balanced with steamed milk and light layer of foam',
                  '\$4.99',
                  false),
              _coffeeListCard(
                  'assets/coffee_shop/starbucks.png',
                  "Caffe Latte",
                  'BrownHouse',
                  'Rich, full-bodied expresso with bittersweet milk sauce and steamed milk',
                  '\$3.99',
                  false),
            ],
          ),
        ),
        SizedBox(height: 15.0),
      ],
    ));
  }

  _coffeeListCard(String imgPath, String coffeeName, String shopName,
      String description, String price, bool isFavorite) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 300,
        width: 225,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 335,
                ),
                Positioned(
                  top: 75,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 20),
                    height: 260,
                    width: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFDAB68C),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
