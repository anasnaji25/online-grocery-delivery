import 'package:flutter/material.dart';
import 'package:appnew/src/pages/cart.dart';

class PersonalTab extends StatefulWidget {
  PersonalTab({Key key}) : super(key: key);

  @override
  _PersonalTabState createState() => _PersonalTabState();
}

class _PersonalTabState extends State<PersonalTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Personal Care',
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              })
        ],
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.red,

                        /* decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Skin Care',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.green,
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Face Care',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.green,
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Hair Care',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.green,
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Oral Care',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.green,
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Sanitary Napkins',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.green,
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Deos & Perfumes',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        color: Colors.green,
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/grocery.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Shaving Needs',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
