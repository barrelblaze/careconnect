class IndivRegModel {
  dynamic senderId;
  //
  String name;
  int contactNumber;
  String email;
  String location;

  String ?loginId;

  String image;

  IndivRegModel({
    this.loginId,
    this.senderId,
    required this.image,
    required this.name,
    required this.contactNumber,
    required this.email,
    // required this.image,
    required this.location,
  });

  Map<String, dynamic> toJson(id) => {
    "image":image,
    "loginId":loginId,
        "senderId": id,
        "name": name,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
      };
  factory IndivRegModel.fromJson(Map<String, dynamic> json) => IndivRegModel(
    image: json["image"],
    loginId: json["loginId"],
        senderId: json["senderId"],
        name: json["name"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        location: json["location"],
      );
}
