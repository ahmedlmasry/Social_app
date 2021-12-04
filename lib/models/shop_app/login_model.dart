import 'package:groub/modules/login/model.dart';

class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromjson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credits;
  String? token;
  UserData(
      {this.id,
      this.credits,
      this.email,
      this.image,
      this.name,
      this.phone,
      this.points,
      this.token});
  UserData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    credits = json['credits'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
    image = json['image'];
  }
}
