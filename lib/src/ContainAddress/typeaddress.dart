import 'package:appnew/src/AddresshiveDataBase/address_model.dart';
import 'package:appnew/src/ContainAddress/show_address.dart';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class TypeAddresspg extends StatefulWidget {
  TypeAddresspg({Key key}) : super(key: key);

  @override
  _TypeAddresspgState createState() => _TypeAddresspgState();
}

class _TypeAddresspgState extends State<TypeAddresspg> {
  final _formKey = GlobalKey<FormState>();

  String name;
  String address;
  String place;
  String pin;
  String phnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.lightGreen,
        title: Text(
          'DeLivery Address',
        ),
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value.isEmpty ? 'enter your name' : null,
                      onSaved: (value) => name = value,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'address'),
                      validator: (value) =>
                          value.isEmpty ? 'enter your address' : null,
                      onSaved: (value) => address = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'place'),
                      validator: (value) =>
                          value.isEmpty ? 'enter your place' : null,
                      onSaved: (value) => place = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Pin'),
                      validator: (value) => value.isEmpty || value == ''
                          ? 'enter your pin'
                          : null,
                      onSaved: (value) => pin = value,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Phone'),
                      validator: (value) => value.length < 10 || value == ''
                          ? 'enter your correct phone number'
                          : null,
                      onSaved: (value) => phnum = value,
                    ),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new MaterialButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: new Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ),
            Expanded(
                child: new MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState.validate() == true) {
                        _formKey.currentState.save();
                        final newAddress =
                            AddressModel(name, address, place, pin, phnum);
                        addAddress(newAddress);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowAddress()));
                      } else {
                        _formKey.currentState.validate();
                      }
                    },
                    child: new Text(
                      "Procceed",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green)),
          ],
        ),
      ),
    );
  }

  void addAddress(AddressModel addressModel) {
    final addressBox = Hive.box('address');
    addressBox.add(addressModel);
  }
}
