import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orphanagemanagement/model/other_models/child_detail_model.dart';
import 'package:orphanagemanagement/model/other_models/child_helath_report.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';

const seperatorText = Text(
  ":",
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
);

final firebaseAuth = FirebaseAuth.instance;

FireStore storeInstence = FireStore();

final currentUserId = FirebaseAuth.instance.currentUser!.uid;

ServiceProvider serviceProviderinstence =ServiceProvider();