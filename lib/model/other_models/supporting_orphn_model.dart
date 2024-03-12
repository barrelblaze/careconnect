class SupportingOrphanModel {
  String? supportingId;
  String? userId;
  String? orphanageId;
  String name;
  String image;
  String numberOfChild;
  String contactNumber;
  String location;
  String isSupporting;
  SupportingOrphanModel(
    
      {required this.contactNumber,
      required this.isSupporting,
      required this.image,
      required this.location,
      required this.name,
      required this.numberOfChild,
      this.orphanageId,
      this.supportingId,
      this.userId});
  Map<String, dynamic> toJson(uid, orphanageId) => {
    "isSupporting":isSupporting,
        "supportingId": uid,
        "userId": uid,
        "orphanageId": orphanageId,
        "name": name,
        "image": image,
        "numberOfChild": numberOfChild,
        "contactNumber": contactNumber,
        "location": location,
      };

  factory SupportingOrphanModel.fromJson(Map<String, dynamic> json) =>
      SupportingOrphanModel(
        isSupporting: json["isSupporting"],
          contactNumber: json["contactNumber"],
          image: json["image"],
          location: json["location"],
          name: json["name"],
          numberOfChild: json["numberOfChild"],
          orphanageId: json["orphanageId"],
          supportingId: json["supportingId"],
          userId: json["userId"]);
}
