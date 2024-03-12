

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/store_image.dart';
import 'package:provider/provider.dart';

class EditProfileImageOrganization extends StatelessWidget {
  const EditProfileImageOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FireStore>(builder: (context, firestore, child) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(children: [
            const Gap(60),
            Align(
                alignment: Alignment.topLeft,
                child: customeText(
                    text: "Profile Image", size: 24, textcolor: black)),
            const Gap(90),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: storeInstence.orgnRegModel!.image == ""
                              ? imageNotFound
                              : NetworkImage(
                                  storeInstence.orgnRegModel!.image!))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 95),
                  child: SizedBox(
                    height: 20,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: appThemeGrey),
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          color: black,
                          size: 20,
                        )),
                  ),
                )
              ],
            ),
            Gap(50),
            InkWell(
              onTap: () async {
                await selectImage(context).then((value) =>
                    firestore.uploadUsersImageToFirebase(imageFile!));
                await storeInstence.fetchCurrentOrganization(currentUserId);
                noti("Profile is Updated Successfully");
              },
              child: Container(
                height: hight * .04,
                width: width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: GradientBoxBorder(
                      width: 3,
                      gradient: LinearGradient(colors: [green, blue])),
                ),
                child: Center(
                    child: customeText(
                        text: "Change Image",
                        textcolor: grey600,
                        size: 22,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const Gap(30),
            SizedBox(
              height: hight * .04,
              width: width * .5,
              child: easyButton(
                onpressed: () async {
                  await firestore.deleteOrganizationImage(currentUserId);
                  await storeInstence.fetchCurrentOrganization(currentUserId);
                },
                borderColor: grey600,
                bordRadius: 50,
                bordersideWidth: 3.0,
                context: context,
                text: "Remove",
                fontWeight: FontWeight.w400,
                textcolor: grey600,
                bgColor: const MaterialStatePropertyAll(Colors.transparent),
              ),
            ),
            const Gap(120),
            SizedBox(
              height: hight * .05,
              width: width * .3,
              child: customeGradientButtom(
                  onpressed: () {
                    storeInstence.fetchCurrentOrganization(currentUserId);
                  },
                  context: context,
                  text: "Save",
                  fontWeight: FontWeight.w500,
                  textcolor: white,
                  bgColor: const MaterialStatePropertyAll(black)),
            ),
          ]),
        );
      }),
    );
  }
}
