import 'package:flutter/cupertino.dart';

abstract class User {
  String id;
  String name;
  String phonenumber;
  String address;
  bool isActive;
  String imageUrl;

  User({
    @required this.id,
    @required this.name,
    this.imageUrl,
    this.isActive,
    this.address,
    this.phonenumber,
  });
}
