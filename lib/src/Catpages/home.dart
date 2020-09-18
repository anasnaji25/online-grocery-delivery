import 'package:appnew/src/ContainAddress/Getaddresspg.dart';
import 'package:flutter/material.dart';
import 'package:appnew/src/pages/cart.dart';

class HomekitchTab extends StatefulWidget {
  HomekitchTab({Key key}) : super(key: key);

  @override
  _HomekitchTabState createState() => _HomekitchTabState();
}

class _HomekitchTabState extends State<HomekitchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Home & Kitchen',
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_basket,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              })
        ],
      ),
      body: GetAddresspg(),
    );
  }
}
