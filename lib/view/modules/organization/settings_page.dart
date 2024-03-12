import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class SettingsPageOrganization extends StatefulWidget {
  SettingsPageOrganization({super.key});

  @override
  State<SettingsPageOrganization> createState() => _SettingsPageOrganizationState();
}

class _SettingsPageOrganizationState extends State<SettingsPageOrganization> {
   FirebaseAuths firebaseAuths = FirebaseAuths();
  bool onToggle = false;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(70),
              customeText(
                text: "Settings",
                size: 25,
              ),
              const Gap(60),
              easyButtonforSetting(
                  actionImage: FlutterSwitch(
                      duration: const Duration(milliseconds: 0),
                      activeColor: white,
                      inactiveColor: white,
                      toggleColor: black,
                      inactiveIcon: const CircleAvatar(
                        backgroundColor: black,
                      ),
                      activeIcon: const CircleAvatar(
                        backgroundColor: black,
                      ),
                      width: 55,
                      height: 30,
                      value: onToggle,
                      onToggle: (selected) {
                        setState(() {
                          onToggle = selected;
                        });
                      }),
                  bgColor: MaterialStatePropertyAll(appThemeGrey),
                  image: penImage,
                  text: "Notifications",
                  textcolor: grey600,
                  context: context,
                  fontWeight: FontWeight.w400),
              const Gap(30),
              const Expanded(child: SizedBox()),
              easyButtonforSetting(
                  onpressed: () {
                      firebaseAuths.signOut(context);
                  },
                  bgColor: MaterialStatePropertyAll(appThemeGrey),
                  image: logoutImage,
                  text: "Log out",
                  textcolor: grey600,
                  context: context,
                  fontWeight: FontWeight.w400)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Get.to(()=>MainPageOrganization(selectedIndex: 0));
              } else if (index == 1) {
                Get.to(()=>MainPageOrganization(selectedIndex: 1));
              } else {
                Get.to(()=>MainPageOrganization(selectedIndex: 2));
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   "assets/chatG.png",
                // ),
                icon: Image.asset(
                  "assets/chatIndivi.png",
                ),
                label: ""),
            BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   "assets/homeG.png",
                // ),
                icon: Image.asset(
                  "assets/homeIndivi (2).png",
                ),
                label: ""),
            BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   "assets/userG.png",
                // ),
                icon: Image.asset(
                  "assets/userIndivi.png",
                ),
                label: ""),
          ],
        ));
  }

  Widget easyButtonforSetting(
      {String? text,
      FontWeight? fontWeight,
      context,
      image,
      Widget? actionImage,
      bordersideWidth,
      void Function()? onpressed,
      MaterialStateProperty<Color?>? bgColor,
      textcolor}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .90,
      height: MediaQuery.of(context).size.height * .06,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          side: MaterialStateProperty.all(
              BorderSide(color: black, width: bordersideWidth ?? 0)),
          backgroundColor: bgColor,
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Gap(30),
            image ?? const SizedBox(),
            Gap(20),
            customeText(
                text: text,
                textcolor: textcolor,
                size: 20,
                fontWeight: fontWeight ?? FontWeight.w600),
            Gap(100),
            actionImage ?? SizedBox(),
            // Gap(20),
          ],
        ),
      ),
    );
  }
}
