class SocialUserModel {
  String name;
  String email;
  String phone;
  String uId;
  bool isEmailVerified;
  String image;
  String bio;
  String cover;

  SocialUserModel({
    this.uId,
    this.email,
    this.name,
    this.phone,
    this.isEmailVerified,
    this.image,
    this.bio,
    this.cover,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    //json of name
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    //returns map
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
