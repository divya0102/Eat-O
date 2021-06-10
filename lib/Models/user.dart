
import 'package:flutter/material.dart';

class User {
  String name;
  String desc;
  String email;
  String imageUrl;
  String phone;
  String address;

  User({
    @required this.name,
    @required this.desc,
    @required this.email,
    @required this.imageUrl,
    @required this.phone,
    @required this.address,

  });

  get UserName => this.name;
  get UserEmail => this.email;
  get UserDesc => this.desc;
  get UserImage => this.imageUrl;
  get UserAddress => this.address;
  get UserPhone => this.phone;

}