import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/modules/orphanage/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



void checkLoginStatus() async {
  bool isLoggedIn = await getLoggedPrefer();
  if (isLoggedIn == true) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

   await storeInstence.getloginUSer(uid);
  } else {
    Get.to(() => LoginPageOrphanage());
  }
}

Future<bool> getLoggedPrefer() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

void setLoginPrefertrue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  getLoggedPrefer();
}

void setLoginPreferfalse() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  getLoggedPrefer();
}
