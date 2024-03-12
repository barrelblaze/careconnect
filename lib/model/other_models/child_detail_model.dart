import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChildDataRegModel {
  String orpId;
  dynamic childId;
  String name;
  String nickNmae;
  int age;
  String gender;
  String dirthdate;
  String joinDate;
  String location;
  String bloodGroup;
  String orphanType;
  String adoptionStatus;
  String image;
  ChildDataRegModel({
  
    this.childId,
    required this.orpId,
   required this.image,
    required this.adoptionStatus,
    required this.age,
    required this.bloodGroup,
    required this.dirthdate,
    required this.gender,
    required this.joinDate,
    required this.location,
    required this.name,
    required this.nickNmae,
    required this.orphanType,

  });

  Map<String, dynamic> toJson(id) => {
    "image":image,
    "orpId":orpId,
        "childId": id,
        "adoptionStatus": adoptionStatus,
        "age": age,
        "bloodGroup": bloodGroup,
        "dirthdate": dirthdate,
        "gender": gender,
        "joinDate": joinDate,
        "location": location,
        "name": name,
        "nickNmae": nickNmae,
        "orphanType": orphanType
      };
//   factory ChildDataRegModel.fromJson(DocumentSnapshot doc) {

//     Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    factory ChildDataRegModel.fromJson(Map<String, dynamic> json) =>
//  return
    ChildDataRegModel(
      orpId: json["orpId"],
      image: json["image"],
      childId: json["childId"],
      adoptionStatus: json["adoptionStatus"],
      age: json["age"],
      bloodGroup: json["bloodGroup"],
      dirthdate: json["dirthdate"],
      gender: json["gender"],
      joinDate: json["joinDate"],
      location: json["location"],
      name: json["name"],
      nickNmae: json["nickNmae"],
      orphanType: json["orphanType"],
    );
  }

