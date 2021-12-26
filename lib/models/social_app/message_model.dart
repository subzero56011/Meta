class MessageModel {
  String senderId;
  String receiverId;
  String dateTime;
  String text;

  MessageModel({
    this.text,
    this.dateTime,
    this.receiverId,
    this.senderId,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    //json of name
    senderId = json['senderId'];
    dateTime = json['dateTime'];
    receiverId = json['receiverId'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    //returns map
    return {
      'text': text,
      'receiverId': receiverId,
      'senderId': senderId,
      'dateTime': dateTime,
    };
  }
}
