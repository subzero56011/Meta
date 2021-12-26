class PostModel {
  String name;
  String uId;
  String image;
  String dateTime;
  String text;
  String postImage;

  PostModel({
    this.uId,
    this.name,
    this.image,
    this.text,
    this.dateTime,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    //json of name
    image = json['image'];
    name = json['name'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    //returns map
    return {
      'name': name,
      'uId': uId,
      'dateTime': dateTime,
      'image': image,
      'text': text,
      'postImage': postImage,
    };
  }
}
