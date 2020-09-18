import 'package:flutter/material.dart';
import 'package:appnew/src/pages/cart.dart';

class DairyTab extends StatefulWidget {
  DairyTab({Key key}) : super(key: key);

  @override
  _DairyTabState createState() => _DairyTabState();
}

class _DairyTabState extends State<DairyTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.lightGreen,
          title: Text(
            'Dairy & Beverages',
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
                            'Diary',
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
                            'Beverages',
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
        ),);
  }
}
