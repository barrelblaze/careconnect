// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/model/individual/indivi_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/edit_profile_details.dart';
import 'package:orphanagemanagement/view/modules/individual/edit_Individual_rofile-image.dart';
import 'package:orphanagemanagement/view/modules/individual/settings_page.dart';
import 'package:orphanagemanagement/view/modules/individual/signup_page.dart';

class ProfileTabIndividual extends StatelessWidget {
  IndivRegModel indivRegModel;
  ProfileTabIndividual({super.key, required this.indivRegModel});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: customeText(text: "Profile", size: 26),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SettingsPageIndividual());
            },
            icon: Image.asset("assets/Settings.png"),
          )
        ],
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              height: hight * .6,
              width: width,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                        colors: [blue, green],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                borderRadius: BorderRadius.circular(40),
                color: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // customeText(text: "${indivRegModel.name}", size: 24),
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
                                image: storeInstence.indivRegModel!.image == ""
                                    ? imageNotFound
                                    : NetworkImage(
                                        storeInstence.indivRegModel!.image))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  backgroundColor: appThemeGrey),
                              onPressed: () {
                                Get.to(EditProfileImageIndividual());
                              },
                              child: Icon(
                                Icons.edit,
                                color: black,
                                size: 15,
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customeText(text: "Name", size: 20),
                            customeText(text: "Contact no", size: 20),
                            customeText(text: "Email", size: 20),
                            customeText(text: "Location", size: 20),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customeText(text: indivRegModel.name, size: 20),
                            customeText(
                                text: "${indivRegModel.contactNumber}",
                                size: 20),
                            customeText(text: indivRegModel.email, size: 20),
                            customeText(text: indivRegModel.location, size: 20),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: appThemeGrey),
                      onPressed: () {
                        Get.to(EditProfileDetailIndividual(
                          contactNumber: "${indivRegModel.contactNumber}",
                          email: indivRegModel.email,
                          indiName: indivRegModel.name,
                          location: indivRegModel.location,
                        ));
                      },
                      child:
                          customeText(text: "Edit Profile", textcolor: black))
                ],
              ),
            ),
          )),
    );
  }
}
