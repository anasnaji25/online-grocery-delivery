import 'package:appnew/src/hivedatabase/cart_model.dart';
import 'package:appnew/src/widgets/screen_size.dart';

import 'package:flutter/material.dart';
import 'package:appnew/src/logic/model/Products_model.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:appnew/src/pages/cart.dart';

class Veggetpage extends StatefulWidget {
  @override
  _VeggetpageState createState() => _VeggetpageState();
}

class _VeggetpageState extends State<Veggetpage> {
  var curquant;

  var quantlist;

  final cartBox = Hive.box('carts');

  @override
  Widget build(BuildContext context) {
    List productList = Provider.of<List<Productmodel>>(context);
    var quantitys = 1;
    double nprice = 0;

    return productList == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.all(7),
                  child: AspectRatio(
                    aspectRatio: 3.1,
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 150,
                        width: displayWidth(context) * 0.60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 0.9,
                              child: Container(
                                height: 140,
                                width: displayWidth(context) * 0.13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(productList[index].img),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 2.7 / 2,
                              child: Container(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(productList[index].pname,
                                        style: TextStyle(fontSize: 20)),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 4, 0, 3),
                                      child: Container(
                                        width: 134,
                                        child: DropdownButtonFormField(
                                            items: quantlist = [
                                              productList[index].q1,
                                              productList[index].q2
                                            ].map((quant) {
                                              return DropdownMenuItem(
                                                value: quant,
                                                child: Text(quant),
                                              );
                                            }).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                curquant = val;
                                              });
                                            },
                                            hint: Text(
                                              " select quantity",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(55, 61, 0, 0),
                              child: Container(
                                height: 100,
                                child: IconButton(
                                    icon: Icon(Icons.add_circle,
                                        size: 35, color: Colors.green),
                                    onPressed: () {
                                      if (curquant == null) {
                                        _showMyDialog();
                                      } else if (curquant ==
                                          productList[index].q1) {
                                        if (compnme.contains(
                                                productList[index].pname) &&
                                            compqnt.contains(curquant)) {
                                          var ind = compqnt.indexOf(curquant);
                                          print(ind);
                                          final cartModel =
                                              cartBox.getAt(ind) as CartModel;
                                          int iquant =
                                              int.parse(cartModel.quantitys);
                                          double iprice =
                                              double.parse(cartModel.price);
                                          iquant++;
                                          nprice =
                                              iprice + (iprice / (iquant - 1));

                                          cartBox.putAt(
                                              ind,
                                              CartModel(
                                                cartModel.pname,
                                                cartModel.curquant,
                                                cartModel.img,
                                                nprice.toString(),
                                                iquant.toString(),
                                              ));
                                          totalAm.insert(ind, nprice);
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      productList[index].pname +
                                                          'Added ')));

                                          print('contains item');
                                        } else {
                                          final newCart = CartModel(
                                            productList[index].pname,
                                            curquant,
                                            productList[index].img,
                                            productList[index]
                                                .q1price
                                                .toString(),
                                            quantitys.toString(),
                                          );
                                          addToCart(newCart);
                                          setState(() {
                                            compnme
                                                .add(productList[index].pname);
                                            compqnt.add(curquant);
                                            totalAm.add(
                                                productList[index].q1price);
                                          });
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      productList[index].pname +
                                                          'Added to Basket')));
                                        }
                                      } else if (curquant ==
                                          productList[index].q2) {
                                        if (compnme.contains(
                                                productList[index].pname) &&
                                            compqnt.contains(curquant)) {
                                          var ind = compnme.indexOf(
                                              productList[index].pname);
                                          print(ind);
                                          final cartModel =
                                              cartBox.getAt(ind) as CartModel;
                                          int iquant =
                                              int.parse(cartModel.quantitys);
                                          double iprice =
                                              double.parse(cartModel.price);
                                          iquant++;
                                          nprice =
                                              iprice + (iprice / (iquant - 1));
                                          cartBox.putAt(
                                              ind,
                                              CartModel(
                                                  cartModel.pname,
                                                  cartModel.curquant,
                                                  cartModel.img,
                                                  nprice.toString(),
                                                  iquant.toString()));

                                          totalAm.insert(ind, nprice);
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      productList[index].pname +
                                                          'Added ')));
                                          print('contains item');
                                        } else {
                                          final newCart = CartModel(
                                              productList[index].pname,
                                              curquant,
                                              productList[index].img,
                                              productList[index]
                                                  .q2price
                                                  .toString(),
                                              quantitys.toString());
                                          addToCart(newCart);
                                          setState(() {
                                            compnme
                                                .add(productList[index].pname);
                                            compqnt.add(curquant);
                                            totalAm.add(
                                                productList[index].q2price);
                                          });
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      productList[index].pname +
                                                          'Added to Basket')));
                                        }
                                      } else {
                                        _showMyDialog();
                                      }
                                      setState(() {
                                        curquant = null;
                                      });
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            });
  }

  void addToCart(CartModel cartModel) {
    final cartBox = Hive.box('carts');
    cartBox.add(cartModel);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Quantity!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('select Quantity to continue'),
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
