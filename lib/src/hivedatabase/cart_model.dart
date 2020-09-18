import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  final String pname;
  @HiveField(1)
  final String curquant;
  @HiveField(2)
  final String img;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final String quantitys;

  CartModel(this.pname, this.curquant, this.img, this.price, this.quantitys);
}
