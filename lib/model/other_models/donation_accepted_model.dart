import 'package:flutter/material.dart';

class DonationAcceptedmodel {
  String? donationAcceptenceId;
  String? orphanageId;
  String userid;
  // String orphaangename;
  String donationCategory;
  String image;
  String data;
  String userType;
  String dateAndDay;
  String time;
  DonationAcceptedmodel(
      {required this.data,
      // required this.orphaangename,
      required this.orphanageId,
      this.donationAcceptenceId,
      required this.dateAndDay,
      required this.donationCategory,
      required this.image,
      required this.time,
      required this.userType,
      required this.userid});
  Map<String, dynamic> toJson(id) => {
    "orphanageId":orphanageId,
    // "orphaangename":orphaangename,
        "userid": userid,
        "donationAcceptenceId": id,
        "donationCategory": donationCategory,
        "image": image,
        "data": data,
        "userType": userType,
        "dateAndDay": dateAndDay,
        "time": time,
      };

  factory DonationAcceptedmodel.fromJson(Map<String, dynamic> json) =>
      DonationAcceptedmodel(
        // orphaangename: json["orphaangename"],
        orphanageId: json["orphanageId"],
          donationAcceptenceId: json["donationAcceptenceId"],
          data: json["data"],
          dateAndDay: json["dateAndDay"],
          donationCategory: json["donationCategory"],
          image: json["image"],
          time: json["time"],
          userType: json["userType"],
          userid: json["userid"]);
}
