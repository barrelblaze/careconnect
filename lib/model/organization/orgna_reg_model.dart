class OrgnRegModel {
  String? loginId;
  String orgName;
  int contactNumber;
  String email;
  String location;
  String about;

  dynamic orgId;

  String? image;

  OrgnRegModel(
      {this.orgId,
      this.loginId,
      required this.orgName,
      required this.contactNumber,
      required this.email,
      this.image,
      required this.location,
      required this.about});

  Map<String, dynamic> toJson(id) => {
        "image": image,
        "loginId": loginId,
        "orgId": id,
        "orgName": orgName,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
        "about": about
      };
  factory OrgnRegModel.fromJson(Map<String, dynamic> json) => OrgnRegModel(
        image: json["image"],
        loginId: json["loginId"],
        orgId: json["orgId"],
        orgName: json["orgName"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        location: json["location"],
        about: json["about"],
      );
}
