import 'package:appnew/src/SubCategorys/FruitsandVegitables/vegitable.dart';
import 'package:flutter/material.dart';
import 'package:appnew/src/pages/cart.dart';

class FruitsVegTab extends StatefulWidget {
  FruitsVegTab({Key key}) : super(key: key);

  @override
  _FruitsVegTabState createState() => _FruitsVegTabState();
}

class _FruitsVegTabState extends State<FruitsVegTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Fruits And Vegitables',
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
                          'Fruits',
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VegTab()));
                },
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
                          'Vegitables',
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
