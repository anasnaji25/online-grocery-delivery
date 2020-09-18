import 'package:appnew/src/AddresshiveDataBase/address_model.dart';
import 'package:appnew/src/pages/cactgerpg.dart';

import 'package:flutter/material.dart';
import 'package:appnew/src/pages/menu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:appnew/src/hivedatabase/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:appnew/src/logic/services/getadsimgfrbse.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(AddressModelAdapter());

  runApp(MyApp());
  await Hive.openBox('carts');
  await Hive.openBox('address');
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final Adfrbse firebaseServices = Adfrbse();
    return Scaffold(
      body: StreamProvider(
        create: (BuildContext context) => firebaseServices.getAdimgList(),
        child: MCategory(),
      ),
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.green,
        title: Text(
          'Mobi Mart',
        ),
      ),
    );
  }
}
