import 'package:hive/hive.dart';

part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final String place;
  @HiveField(3)
  final String pin;
  @HiveField(4)
  final String phone;

  AddressModel(this.name, this.address, this.place, this.pin, this.phone);
}
