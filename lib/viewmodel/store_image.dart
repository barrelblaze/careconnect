// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

File? imageFile;
String? imageName;
String? imagePath;

final db = FirebaseFirestore.instance;
final firbaseStorage = FirebaseStorage.instance;

storeImageToFileURL(String ref, File file) async {
  print("${file}==============================");
  print("1");
  SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
  print("3");

  UploadTask uploadTask =
      firbaseStorage.ref().child(ref).putFile(file, metadata);
  print("4");
  // print(uploadTask);
  TaskSnapshot snapshot = await uploadTask;
  print("5");
  print("${snapshot}======================================");
  String downloadURL = await snapshot.ref.getDownloadURL();
  print(
      "----------------------$downloadURL---------------------URL-------------------");
  print("6");
  log(downloadURL);
  print(
      "----------------------$downloadURL---------------------URL-------------------");
  return downloadURL;
}

Future<File> _pickImage(context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    imageFile = File(pickedFile.path);
  } else {
    // User canceled the image picking
  }
  print("-------------------image picked---------------");
  return imageFile!;
}

///////////////////////////////////////

///////////////////////////////////////////////////////////////
Future<void> selectImage(context) async {
  imageFile = await _pickImage(context);
  print("-------------------------${imageFile}-----------------------------");
}
