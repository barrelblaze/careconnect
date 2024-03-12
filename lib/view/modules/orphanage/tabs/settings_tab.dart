import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/delete_single_child_detail_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_page.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class SettingsTabOrphanage extends StatelessWidget {
   OrphnRegModel ?orphnRegModel;
  BankDetailModel? bankDetailModel;
  SettingsTabOrphanage({super.key,required this.bankDetailModel,required this.orphnRegModel});
  FirebaseAuths firebaseAuths = FirebaseAuths();
  Image penImage = Image.asset("assets/edit_.png");
  Image logoutImage = Image.asset("assets/log_out.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customeText(
              text: "Settings",
              size: 25,
            ),
            const Gap(20),
            easyButton(
                onpressed: () {
                  Get.to(EditProfileOrphanage(bankDetailModel:bankDetailModel!,orphnRegModel: orphnRegModel!,));
                },
                bgColor: MaterialStatePropertyAll(appThemeGrey),
                image: penImage,
                text: "Edit Profile",
                textcolor: grey600,
                context: context,
                fontWeight: FontWeight.w400),
            const Gap(30),
            // easyButton(
            //     onpressed: () {
            //       Get.to(EditOrDeleteSingleChildDataPageOrphanage());
            //     },
            //     bgColor: MaterialStatePropertyAll(appThemeGrey),
            //     image: penImage,
            //     text: "Edit Child Data",
            //     textcolor: grey600,
            //     context: context,
            //     fontWeight: FontWeight.w400),
            const Expanded(child: SizedBox()),
            easyButton(
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
    );
  }

  Widget easyButton(
      {String? text,
      FontWeight? fontWeight,
      context,
      image,
      bordersideWidth,
      void Function()? onpressed,
      MaterialStateProperty<Color?>? bgColor,
      textcolor}) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * .90,
      height: orientation == landScapeMode ? hight * .08 : hight * .06,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: black, width: bordersideWidth ?? 0)),
          backgroundColor: bgColor,
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(30),
            image ?? const SizedBox(),
            Gap(20),
            customeText(
                text: text,
                textcolor: textcolor,
                size: 20,
                fontWeight: fontWeight ?? FontWeight.w600),
            Gap(30),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
