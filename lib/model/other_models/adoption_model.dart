class AdoptionModel {
  String? adoptionId;
  String userType;
  String senderId;
  String childId;
  String reqStatus;
  String dataAndDay;
  String time;
  String image;
  AdoptionModel(
      {this.adoptionId,
      required this.userType,
      required this.image,
      required this.time,
      required this.dataAndDay,
      required this.childId,
      required this.reqStatus,
      required this.senderId});
  Map<String, dynamic> toJson(id) => {
    "userType":userType,
        "adoptionId": id,
        "senderId": senderId,
        "childId": childId,
        "reqStatus": reqStatus,
        "image": image,
        "time": time,
        "dataAndDay": dataAndDay
      };

  factory AdoptionModel.fromJson(Map<String, dynamic> json) => AdoptionModel(
    userType: json["userType"],
      dataAndDay: json["dataAndDay"],
      image: json["image"],
      time: json["time"],
      adoptionId: json["adoptionId"],
      senderId: json["senderId"],
      childId: json["childId"],
      reqStatus: json["reqStatus"]);
}
