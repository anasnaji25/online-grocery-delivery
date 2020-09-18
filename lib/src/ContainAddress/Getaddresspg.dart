import 'package:appnew/src/ContainAddress/show_address.dart';
import 'package:appnew/src/ContainAddress/typeaddress.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GetAddresspg extends StatefulWidget {
  GetAddresspg({Key key}) : super(key: key);

  @override
  _GetAddresspgState createState() => _GetAddresspgState();
}

class _GetAddresspgState extends State<GetAddresspg> {
  String name;
  String address;
  String place;
  String pin;
  String phnum;

  @override
  Widget build(BuildContext context) {
    final addressBox = Hive.box('address');
    return Scaffold(
        body: addressBox.isNotEmpty ? ShowAddress() : TypeAddresspg());
  }
}
