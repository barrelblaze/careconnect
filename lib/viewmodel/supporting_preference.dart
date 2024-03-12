// import 'dart:convert';

// import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SupportOrphaange {
//   static dynamic orphandata;
//   static dynamic bankData;
//   static const String orphanageKey = 'orphanageKey';
//   static const String bankKey = 'bankKey';
//   static const String orphanageListKey = 'orphnList';
//   static const String bankListKey = 'bankList';

//   // Save the list of students to SharedPreferences
//   static Future saveOrphanageSupportData(
//       OrphnRegModel orphnModel, selectedOrphnId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String jsonString = jsonEncode(orphnModel.toJson(selectedOrphnId));

//     await prefs.setString(orphanageKey, jsonString);
//     return jsonString;
//   }

//   static Future saveBankSupportData(
//     BankDetailModel bankModel,
//   ) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String jsonString = jsonEncode(bankModel.toJson());
//     await prefs.setString(bankKey, jsonString);

//     return jsonString;
//   }

// ////////////////////////////////GET////////////////////////////////////////
//   static getBothSupportData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedOrphanJsonString = prefs.getString(orphanageKey);
//     String? storedBankJsonString = prefs.getString(bankKey);
//     print(storedOrphanJsonString);
//     print(storedBankJsonString);
//   }

// //////////////////////////////SET/////////////////////////////////////////

//   static supportBoth({
//     OrphnRegModel? orphnModel,
//     selectedOrphnId,
//     BankDetailModel? bankModel,
//   }) async {
//     bankData = await saveBankSupportData(bankModel!);
//     orphandata = await saveOrphanageSupportData(orphnModel!, selectedOrphnId);
//     await getBothSupportData();
//   }

// ///////////////////////////////LIST//////////////////////////
//   static settoList() async {
//     print("--------------------Listing-----------------");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList(orphanageListKey, orphandata);
//     await prefs.setString(bankListKey, bankData);
//     await getList();
//   }

//   static getList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final value = prefs.getStringList(orphanageListKey);
//     final bankvalue = prefs.getStringList(bankListKey);
//     print(value);
//     print(bankvalue);
//   }
// }
