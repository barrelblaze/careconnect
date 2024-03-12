// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/model/individual/indivi_reg_model.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/model/other_models/adoption_model.dart';
import 'package:orphanagemanagement/model/other_models/child_detail_model.dart';
import 'package:orphanagemanagement/model/other_models/child_helath_report.dart';
import 'package:orphanagemanagement/model/other_models/login_model.dart';
import 'package:orphanagemanagement/model/other_models/supporting_orphn_model.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/viewmodel/store_image.dart';

final db = FirebaseFirestore.instance;

class FireStore with ChangeNotifier {
  bool isRemove = false;
  bool isSave = false;
  ChildDataRegModel? childDataRegModel;
  ChildHealthReportModel? childHealthReportModel;
  LoginTable? loginTable;
  OrphnRegModel? orphnRegModel;
  BankDetailModel? bankDetailModel;
  IndivRegModel? indivRegModel;
  OrgnRegModel? orgnRegModel;
  List<SupportingOrphanModel>? supportingList;
  SupportingOrphanModel? supportingOrphanModel;

  /////////////////////////

  TextEditingController serchController = TextEditingController();

////////////////////////////ORPHANAGE//////////////////////////
  List<OrphnRegModel> orphanageList = [];
  List<BankDetailModel> bankList = [];

  Future<void> addOrphnToFirestore(
    OrphnRegModel orphnRegModel,
    BankDetailModel bankDetailModel,
  ) async {
    final orphanageRef = db.collection("Orphanage");
    final docs = orphanageRef.doc(orphnRegModel.loginId);
    await docs.set(orphnRegModel.toJson(
      docs.id,
    ));

    final bankDetailsReference = docs.collection("Bank Details");
    await bankDetailsReference
        .doc(orphnRegModel.loginId)
        .set(bankDetailModel.toJson());
    fetchCurrentOrphanage(orphnRegModel.loginId);
    print("-------add orphn-------------");
  }

  Future<List<OrphnRegModel>> fetchAllOrphanages() async {
    QuerySnapshot<Map<String, dynamic>> snapshotOrphan =
        await db.collection("Orphanage").get();
    orphanageList = snapshotOrphan.docs.map((doc) {
      return OrphnRegModel.fromJson(doc.data());
    }).toList();
    print("-------fetch orphn-------------");
    fetchAllBankdata();
    print(orphanageList.length);
    // notifyListeners();
    return orphanageList;
  }

  Future<List<BankDetailModel>> fetchAllBankdata() async {
    QuerySnapshot<Map<String, dynamic>> childReportSnapshot =
        await db.collection("Orphanage").doc().collection("Bank Details").get();
    bankList = childReportSnapshot.docs.map((doc) {
      return BankDetailModel.fromJson(doc.data());
    }).toList();
    print("-------fetch bank-------------");
    print(bankList.length);
    // notifyListeners();
    return bankList;
  }

///////////////////////////iNDIVIDUAL//////////////////////////////////
  List<IndivRegModel> individualList = [];
  Future<void> addIndividualToFirestore(IndivRegModel indivRegModel) async {
    final individualRef = db.collection("Individual");
    final docs = individualRef.doc(indivRegModel.loginId);
    await docs.set(indivRegModel.toJson(docs.id));
    print("-------add individual-------------");
  }

  Future<List<IndivRegModel>> fetchIndividual() async {
    try {
      QuerySnapshot<Map<String, dynamic>> indSnapshot =
          await db.collection('Individual').get();

      individualList = indSnapshot.docs.map((doc) {
        return IndivRegModel.fromJson(doc.data());
      }).toList();
      print(individualList[0].name);
      print("-------fetch individual-------------");
      return individualList;
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return [];
    }
  }

  addSupportOrphanageInIndividual( currentOrphanageId,
      SupportingOrphanModel supportingOrphanModel) async {
    final indCollectionRef = db.collection("Individual");
    final docs = indCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Supporting Orphanages")
        .doc(currentOrphanageId);
    docs.set(supportingOrphanModel.toJson(FirebaseAuth.instance.currentUser!.uid, currentOrphanageId));
  }

  getAllSupportingOrphanageinIndividual() async {
    QuerySnapshot<Map<String, dynamic>> indSuppSnapshot = await db
        .collection("Individual")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Supporting Orphanages")
        .get();
    supportingList = indSuppSnapshot.docs.map((doc) {
      return SupportingOrphanModel.fromJson(doc.data());
    }).toList();
    // notifyListeners();
  }

/////////////////////////ORGANIZATION//////////////////////////////
  List<OrgnRegModel> orgList = [];

  Future<void> addOrganizationToFirestore(OrgnRegModel orgnRegModel) async {
    final organizationRef = db.collection("Organization");
    final docs = organizationRef.doc(orgnRegModel.loginId);
    await docs.set(orgnRegModel.toJson(docs.id));
    print("-------add organization-------------");
  }

  Future<List<OrgnRegModel>> fetchOrganization() async {
    try {
      QuerySnapshot<Map<String, dynamic>> orgSnapshot =
          await db.collection('Organization').get();

      orgList = orgSnapshot.docs.map((doc) {
        return OrgnRegModel.fromJson(doc.data());
      }).toList();
      print(orgList[0].about);
      print("-------fetch organaization-------------");
      return orgList;
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return [];
    }
  }

  addSupportOrphanageInOrganization(currentUID, currentOrphanageId,
      SupportingOrphanModel supportingOrphanModel) async {
    final orgCollectionRef = db.collection("Organization");
    final docs = orgCollectionRef
        .doc(currentUID)
        .collection("Supporting Orphanages")
        .doc(currentOrphanageId);
    await docs
        .set(supportingOrphanModel.toJson(currentUID, currentOrphanageId));
  }

  getAllSupportingOrphanageinOrganization(currentUID) async {
    QuerySnapshot<Map<String, dynamic>> orgSuppSnapshot = await db
        .collection("Organization")
        .doc(currentUID)
        .collection("Supporting Orphanages")
        .get();
    supportingList = orgSuppSnapshot.docs.map((doc) {
      return SupportingOrphanModel.fromJson(doc.data());
    }).toList();
    notifyListeners();
  }

  //////////////////////////////ADD CHILD //////////////////////////
  List<ChildDataRegModel> childList = [];
  List<ChildHealthReportModel> childReport = [];

  Future<void> addChildToFirestore(ChildDataRegModel childDataRegModel,
      ChildHealthReportModel childHealthReportModel) async {
    final childDataRef = db.collection("Child Data");
    final docs = childDataRef.doc();

    await docs.set(childDataRegModel.toJson(docs.id));

    CollectionReference childHelthRef = docs.collection("Health Report");
    await childHelthRef.doc(docs.id).set(
          childHealthReportModel.toJson(docs.id),
        );
    childList.add(childDataRegModel);
    childReport.add(childHealthReportModel);
    print("-------add child-------------");
    await fetchSelectedOrpahanageChilds(FirebaseAuth.instance.currentUser!.uid).then((value){
      _updateCurrentOrphanageChildCount(value.length);
    });
    notifyListeners();
  }
  
_updateCurrentOrphanageChildCount(updatedCount){
    db.collection("Orphanage").doc(FirebaseAuth.instance.currentUser!.uid).update({"childCount":updatedCount});
  }
  Future<List<ChildDataRegModel>> fetchAllChildinfo() async {
    childList.clear();
    QuerySnapshot<Map<String, dynamic>> childDataSnapshot =
        await db.collection("Child Data").get();
    childList = childDataSnapshot.docs.map((doc) {
      return ChildDataRegModel.fromJson(doc.data());
    }).toList();
    print(childList.length);
    print("-------fetch child data-------------");
    // notifyListeners();
    return childList;
  }
List<ChildDataRegModel> currentOrphanChildList=[];
    Future<List<ChildDataRegModel>> fetchSelectedOrpahanageChilds(orphanId) async {
    currentOrphanChildList.clear();
    QuerySnapshot<Map<String, dynamic>> childDataSnapshot =
        await db.collection("Child Data").where("orpId",isEqualTo: orphanId).get();
    currentOrphanChildList = childDataSnapshot.docs.map((doc) {
      return ChildDataRegModel.fromJson(doc.data());
    }).toList();
    print(currentOrphanChildList.length);
    print("-------fetch child data-------------");
    // notifyListeners();
    return currentOrphanChildList;
  }
// ChildDataRegModel? adoptedchilddata;
AdoptionModel ?adoptionModel2;
 Future<String> fetchselectedAdoptionData(adoptionid)async{
 DocumentSnapshot<Map<String, dynamic>> doc=await db.collection("Adoption Request").doc(adoptionid).get();
if(doc.exists){
  adoptionModel2=AdoptionModel.fromJson(doc.data()!);
  print(adoptionModel2!.adoptionId);
  

  print(adoptionModel2!.childId);
}
  return adoptionModel2!.childId;
}




  fechSingleChildAllData(childId) async {
    DocumentSnapshot<Map<String, dynamic>> childDataSnapshot =
        await db.collection("Child Data").doc(childId).get();
    DocumentSnapshot<Map<String, dynamic>> childReportSnapshot = await db
        .collection("Child Data")
        .doc(childId)
        .collection("Health Report")
        .doc(childId)
        .get();

    if (childDataSnapshot.exists) {
      childDataRegModel = ChildDataRegModel.fromJson(childDataSnapshot.data()!);
      childHealthReportModel =
          ChildHealthReportModel.fromJson(childReportSnapshot.data()!);
      print("-------fetch single chld data-------------");
      // notifyListeners();
    } else {
      print('Child not found');
    }

    return childDataRegModel;
  }

  removeChild(chilId) async {
    final childRef = db.collection("Child Data");
    childRef.doc(chilId).delete();

    // final subColectionRef = childRef.doc(chilId).collection("Helth Report");
    // subColectionRef.doc(subColectionRef.id).delete();
  }

////////////////////add login data //////////////////
  List<LoginTable> userList = [];
  Future<void> addUsertoLoginTable(uid, LoginTable loginTable) async {
    final userRef = db.collection("user");
    final docs = userRef.doc(uid);
    await docs.set(loginTable.toJson(uid));
    print("----------------added user-----------------");
  }

/////////////////////////////////////////////////////////////////
/////////////////////////fetchUser///////////////////////////////
  getloginUSer(loginId) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(loginId ).get();
    if (userSnapshot.exists) {
      loginTable = LoginTable.fromJson(userSnapshot.data()!);
      print(userSnapshot.data()!);
      print("--------fetchd user------");
    }

    final type = userSnapshot.get("type");
    print("--------------------${type}-----------------------");
    if (type == "Orphanage") {
      await fetchCurrentOrphanage(loginId);
    } else if (type == "Organization") {
      await fetchCurrentOrganization(loginId);
    } else if (type == "Individual") {
      await fetchCurrentIndividual(loginId);
    }
  }

////////////////////////////////////////////////////////////
  fetchorphan(loginId) async {
    print(loginId);
    DocumentSnapshot orphanageSnapshot =
        await db.collection("Orphanage").doc(loginId).get();
    DocumentSnapshot bankSnapshot = await db
        .collection("Orphanage")
        .doc(loginId)
        .collection("Bank Details")
        .doc(loginId)
        .get();

    if (orphanageSnapshot.exists) {
      orphnRegModel = OrphnRegModel.fromJson(
          orphanageSnapshot.data() as Map<String, dynamic>);

      print(orphanageSnapshot.data());
      bankDetailModel =
          BankDetailModel.fromJson(bankSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the current user data---------------------");
      // notifyListeners();
    } else {
      print("error");
    }
  }

  fetchCurrentOrphanage(loginId) async {
    print(loginId);
    DocumentSnapshot orphanageSnapshot =
        await db.collection("Orphanage").doc(loginId).get();
    DocumentSnapshot bankSnapshot = await db
        .collection("Orphanage")
        .doc(loginId)
        .collection("Bank Details")
        .doc(loginId)
        .get();

    if (orphanageSnapshot.exists) {
      orphnRegModel = OrphnRegModel.fromJson(
          orphanageSnapshot.data() as Map<String, dynamic>);

      print(orphanageSnapshot.data());
      bankDetailModel =
          BankDetailModel.fromJson(bankSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the current user data---------------------");
      notifyListeners();
      Get.offAll(() => MainPageOrphanage(
            bankDetailModel: bankDetailModel,
            orphnRegModel: orphnRegModel,
          ));
    } else {
      print("error");
    }
  }

  fetchCurrentIndividualNow(loginId) async {
    DocumentSnapshot individualSnapshot =
        await db.collection("Individual").doc(loginId).get();

    if (individualSnapshot.exists) {
      indivRegModel = IndivRegModel.fromJson(
          individualSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the current user data---------------------");
      print("------------fetch completed individual---------------------");
      // notifyListeners();
    } else {
      print("error");
    }
  }

  fetchCurrentIndividual(loginId) async {
    DocumentSnapshot individualSnapshot =
        await db.collection("Individual").doc(loginId).get();

    if (individualSnapshot.exists) {
      indivRegModel = IndivRegModel.fromJson(
          individualSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the current user data---------------------");
      print("------------fetch completed individual---------------------");
      notifyListeners();
      Get.offAll(() => MainPageIndividual(
            selectedIndex: 1,
            // indivRegModel: indivRegModel,
          ));
    } else {
      print("error");
    }
  }

  fetchOrganizationnow(loginId) async {
    print(loginId);
    DocumentSnapshot organizationSnapshot =
        await db.collection("Organization").doc(loginId).get();

    if (organizationSnapshot.exists) {
      orgnRegModel = OrgnRegModel.fromJson(
          organizationSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the current user data---------------------");
      print("------------fetch completed Organization---------------------");
      notifyListeners();
    } else {
      print("error");
    }
  }

  fetchCurrentOrganization(loginId) async {
    print(loginId);
    DocumentSnapshot organizationSnapshot =
        await db.collection("Organization").doc(loginId).get();

    if (organizationSnapshot.exists) {
      orgnRegModel = OrgnRegModel.fromJson(
          organizationSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the current user data---------------------");
      print("------------fetch completed Organization---------------------");
      notifyListeners();
      Get.offAll(() => MainPageOrganization(
            selectedIndex: 1,
          ));
    } else {
      print("error");
    }
  }

  ////////////////////UPLOAD IMAGEAND DELETE IMAGE //////////////////
  uploadUsersImageToFirebase(File file) async {
    isSave = true;
    notifyListeners();
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(currentUserId).get();
    if (userSnapshot.exists) {
      loginTable = LoginTable.fromJson(userSnapshot.data()!);
      print(userSnapshot.data()!);
      print("--------fetchd user for image upload------");

      await storeImageToFileURL("userimage/$currentUserId", file)
          .then((value) async {
        print("${value}-----value----------------");

        final type = userSnapshot.get("type");
        print("--------------------${type}-----------------------");
        if (type == "Orphanage") {
          DocumentReference docRef =
              db.collection('Orphanage').doc(currentUserId);
          docRef.update({'image': value});
          DocumentSnapshot orphanSnapshot = await docRef.get();
          print(orphanSnapshot.data());
          orphnRegModel = OrphnRegModel.fromJson(
              orphanSnapshot.data() as Map<String, dynamic>);

          print("---------orphn img successfully uploaded --------------");

          notifyListeners();
        } else if (type == "Organization") {
          DocumentReference docRef =
              db.collection('Organization').doc(currentUserId);
          docRef.update({'image': value});
          DocumentSnapshot organizationSnapshot = await docRef.get();
          print(organizationSnapshot.data());
          orgnRegModel = OrgnRegModel.fromJson(
              organizationSnapshot.data() as Map<String, dynamic>);
          print("---------organ img successfully uploaded --------------");
          notifyListeners();
        } else if (type == "Individual") {
          DocumentReference docRef =
              db.collection('Individual').doc(currentUserId);
          docRef.update({'image': value});
          DocumentSnapshot individualSnapshot = await docRef.get();
          print(individualSnapshot.data());
          indivRegModel = IndivRegModel.fromJson(
              individualSnapshot.data() as Map<String, dynamic>);
          print("---------indi img successfully uploaded --------------");
          isSave = false;
          notifyListeners();
        }
      });
      notifyListeners();
    }
    // return isSave;
  }

  deleteOrphanageImage(uid) {
    final orphnRef = db.collection("Orphanage");
    orphnRef.doc(uid).update({"image": ""});
    notifyListeners();
  }

  deleteindividualImage(id) {
    final indiRef = db.collection("Individual");
    indiRef.doc(id).update({"image": ""});
    notifyListeners();
  }

  deleteOrganizationImage(id) {
    final orgRef = db.collection("Organization");
    orgRef.doc(id).update({"image": ""});
    notifyListeners();
  }

  uploadChilimageToFirestore(currentChilId, File file) async {
    // final currentChilId =await childHealthReportModel!.childid;
    await storeImageToFileURL("childIMG/${currentChilId}", file)
        .then((value) async {
      DocumentReference docRef = db.collection('Child Data').doc(currentChilId);
      await docRef.update({"image": value});
      DocumentSnapshot childSnapshot = await docRef.get();
      childDataRegModel = ChildDataRegModel.fromJson(
          childSnapshot.data() as Map<String, dynamic>);

      notifyListeners();
    });
  }
  /////////////////////////////UPDATE//////////////////////////
  //////// UPGATE ORPHANAGE DETAIL//////////

  updateOrphanageDetails(currentUID, OrphnRegModel orphnRegModel,
      BankDetailModel bankDetailModel) async {
    final orphnRef = db.collection('Orphanage');

    final orphnDocs = orphnRef.doc(currentUID);
    orphnDocs.update(orphnRegModel.toJson(currentUID));

    final bankDocs = orphnRef.doc(currentUID);
    bankDocs.update(bankDetailModel.toJson());

    DocumentSnapshot orphnSnapshot = await orphnDocs.get();
    orphnRegModel =
        OrphnRegModel.fromJson(orphnSnapshot.data() as Map<String, dynamic>);
    DocumentSnapshot bankSnapshot = await orphnDocs.get();
    bankDetailModel =
        BankDetailModel.fromJson(bankSnapshot.data() as Map<String, dynamic>);
    notifyListeners();
  }

  ///////////////////////////////update individual details//////////////////////////////////////
  updateIndividualDetails(currentUID, IndivRegModel indivRegModel) async {
    final indiRef = db.collection('Individual');

    final indiDoc = indiRef.doc(currentUID);
    indiDoc.update(indivRegModel.toJson(currentUID));
    DocumentSnapshot indSnapshot = await indiDoc.get();
    indivRegModel =
        IndivRegModel.fromJson(indSnapshot.data() as Map<String, dynamic>);

    notifyListeners();
  }

/////////////////////////////////Update Organaization Details///////////////////////////////
  updateOrganizationDetails(currentUID, OrgnRegModel orgnRegModel) async {
    final orgRef = db.collection('Organization');

    final orgDec = orgRef.doc(currentUID);
    orgDec.update(orgnRegModel.toJson(currentUID));
    DocumentSnapshot indSnapshot = await orgDec.get();
    indivRegModel =
        IndivRegModel.fromJson(indSnapshot.data() as Map<String, dynamic>);

    notifyListeners();
  }

  ////////////////////////Get Selected ORPHANAGE    Organization   Idicdual///////////////
  getSelectedOrphanageData(orphnId) async {
    DocumentSnapshot orphanageSnapshot =
        await db.collection("Orphanage").doc(orphnId).get();
    DocumentSnapshot bankSnapshot = await db
        .collection("Orphanage")
        .doc(orphnId)
        .collection("Bank Details")
        .doc(orphnId)
        .get();

    if (orphanageSnapshot.exists) {
      orphnRegModel = OrphnRegModel.fromJson(
          orphanageSnapshot.data() as Map<String, dynamic>);
      bankDetailModel =
          BankDetailModel.fromJson(bankSnapshot.data() as Map<String, dynamic>);
      print(
          "------------fetch completed ,have the selected orphanage data---------------------");
    }

    // notifyListeners();
  }

  getSelectedOrganizationData(orgId) async {
    DocumentSnapshot organizationSnapshot =
        await db.collection("Organization").doc(orgId).get();
    DocumentSnapshot supportingSnapshot = await db
        .collection("Organization")
        .doc(orgId)
        .collection("Supporting Orphanages")
        .doc(orgId)
        .get();

    if (organizationSnapshot.exists) {
      orgnRegModel = OrgnRegModel.fromJson(
          organizationSnapshot.data() as Map<String, dynamic>);
    }
    if (supportingSnapshot.exists) {
      supportingOrphanModel = SupportingOrphanModel.fromJson(
          supportingSnapshot.data() as Map<String, dynamic>);
    }

    print(
        "------------fetch completed ,have the selected organization  data---------------------");

    // notifyListeners();
  }

  getSelectedIndividualData(indId) async {
    DocumentSnapshot individualSnapshot =
        await db.collection("Individual").doc(indId).get();
    DocumentSnapshot supportingSnapshot = await db
        .collection("Individual")
        .doc(indId)
        .collection("Supporting Orphanages")
        .doc(indId)
        .get();

    if (individualSnapshot.exists) {
      indivRegModel = IndivRegModel.fromJson(
          individualSnapshot.data() as Map<String, dynamic>);
      // notifyListeners();
    }
    if (supportingSnapshot.exists) {
      supportingOrphanModel = SupportingOrphanModel.fromJson(
          supportingSnapshot.data() as Map<String, dynamic>);
      // notifyListeners();
    }

    print(
        "------------fetch completed ,have the selected Individual data---------------------");

    // notifyListeners();
  }

 
}
