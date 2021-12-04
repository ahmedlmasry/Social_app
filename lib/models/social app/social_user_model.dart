class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? cover;
  bool? isEmailVerified;
  String? bio;

  SocialUserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.bio,
    this.image,
    this.cover,
    this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    cover = json['cover'];
    bio = json['bio'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'isEmailVerified': isEmailVerified,
      'image': image,
      'bio': bio,
      'cover': cover,
      'uId': uId,
    };
  }
}
