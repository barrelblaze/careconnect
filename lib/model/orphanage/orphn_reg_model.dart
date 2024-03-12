class OrphnRegModel {
  dynamic orphnId;
  String orphnName;
  String about;
  int childCount;
  int contactNumber;
  String email;
  String location;
  String? loginId;
  String? image;
  // String isSupporting;
  // int? workersCount;
  OrphnRegModel({
    this.orphnId,
    this.loginId,
    // required this.isSupporting,
    required this.orphnName,
    required this.about,
    required this.childCount,
    required this.contactNumber,
    required this.email,
    this.image,
    required this.location,
  });

  Map<String, dynamic> toJson(
    id,
  ) =>
      {
        // "isSupporting":isSupporting,
        "image": image,
        "orphnId": id,
        "orphnName": orphnName,
        "about": about,
        "childCount": childCount,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
        "loginId": loginId,
        // "image": image,
        // "workersCount": workersCount
      };
  factory OrphnRegModel.fromJson(Map<String, dynamic> json) => OrphnRegModel(
    // isSupporting: json["isSupporting"],
        image: json["image"],
        orphnId: json["orphnId"],
        loginId: json["loginId"],
        childCount: json["childCount"],
        orphnName: json["orphnName"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        location: json["location"],
        about: json["about"],
      );
}

class BankDetailModel {
  // int orphnId;
  String bank;
  String epaymentnumber;
  int contactNumber;
  String accountNumber;
  BankDetailModel(
      {required this.accountNumber,
      required this.bank,
      required this.contactNumber,
      required this.epaymentnumber});
  Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
        "bank": bank,
        "epaymentNumber": epaymentnumber,
        "contactNumber": contactNumber,
      };
  factory BankDetailModel.fromJson(Map<String, dynamic> json) =>
      BankDetailModel(
          accountNumber: json["accountNumber"],
          bank: json["bank"],
          contactNumber: json["contactNumber"],
          epaymentnumber: json["epaymentnumber"] ?? "hhhh");
}
