import 'package:appnew/src/AddresshiveDataBase/address_model.dart';
import 'package:appnew/src/ContainAddress/typeaddress.dart';
import 'package:appnew/src/pages/delivery_timepik.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:geolocator/geolocator.dart';

List<dynamic> latlong = List();
List<dynamic> locality = List();

class ShowAddress extends StatefulWidget {
  ShowAddress({Key key}) : super(key: key);

  @override
  _ShowAddressState createState() => _ShowAddressState();
}

class _ShowAddressState extends State<ShowAddress> {
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
      // ignore: deprecated_member_use
      body: WatchBoxBuilder(
          box: Hive.box('address'),
          builder: (context, addressBox) {
            return ListView.builder(
                itemCount: addressBox.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressModel = addressBox.getAt(index) as AddressModel;
                  return addressBox.isEmpty
                      ? Center(
                          child: Container(
                              height: 100,
                              child: Text('No Details',
                                  style: TextStyle(color: Colors.black))),
                        )
                      : Container(
                          height: 300,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Card(
                                    elevation: 6,
                                    child: ListView(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 12),
                                          child: Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 3),
                                          child: Text(addressModel.name,
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(addressModel.address,
                                              style: TextStyle(fontSize: 17)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(addressModel.place,
                                              style: TextStyle(fontSize: 17)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 3),
                                          child: Text(addressModel.pin,
                                              style: TextStyle(fontSize: 17)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(addressModel.phone,
                                              style: TextStyle(fontSize: 17)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 40,
                                    child: new RaisedButton(
                                        elevation: 4.0,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0)),
                                        padding: EdgeInsets.only(
                                            top: 7.0,
                                            bottom: 7.0,
                                            right: 20.0,
                                            left: 7.0),
                                        onPressed: () async {
                                          Position position = await Geolocator()
                                              .getCurrentPosition(
                                                  desiredAccuracy:
                                                      LocationAccuracy.high);
                                          print(position.latitude);
                                          print(position.longitude);
                                          print(position);
                                          latlong.add(position.latitude);
                                          latlong.add(position.longitude);
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text('Location added')));

                                          List<Placemark> p = await Geolocator()
                                              .placemarkFromCoordinates(
                                                  position.latitude,
                                                  position.longitude);

                                          Placemark place = p[0];
                                          print(place.locality);
                                          locality.add(place.locality);
                                        },
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(Icons.add_location),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10.0),
                                                child: new Text(
                                                  "Add Location ",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        ),
                                        textColor: Color(0xFF292929),
                                        color: Colors.blue[100]),
                                  ),
                                ),
                              ],
                            ),
                          ));
                });
          }),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new MaterialButton(
                onPressed: () {
                  final addressBox = Hive.box('address');
                  addressBox.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TypeAddresspg()));
                },
                child: new Text(
                  "update",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.white,
              ),
            ),
            Expanded(
                child: new MaterialButton(
                    onPressed: () {
                      if (locality.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseTime()));
                      } else {
                        _showMyDialog();
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

  /*Future<Dynamic> _getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      print(position.longitude);
      print(position);
      latlong.add(position.latitude);
      latlong.add(position.longitude);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Location added')));

      
      List<Placemark> p = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);

     
      Placemark place = p[0];
      print(place.locality);
      locality.add(place.locality);
    } catch (e) {
      _showLocDialog();
      print(e);
    }
  }

  Future<void> _showLocDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Something went Wrong!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Make sure location enabled'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Location!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Add Location for Faster Delivery'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
