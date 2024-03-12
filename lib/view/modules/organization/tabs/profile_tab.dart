import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/organization/edit_organization_profile-image.dart';
import 'package:orphanagemanagement/view/modules/organization/edit_profile_details.dart';
import 'package:orphanagemanagement/view/modules/organization/settings_page.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class ProfileTabOrganization extends StatefulWidget {
  ProfileTabOrganization({
    super.key,
  });

  @override
  State<ProfileTabOrganization> createState() => _ProfileTabOrganizationState();
}

class _ProfileTabOrganizationState extends State<ProfileTabOrganization> {
  bool isExpanded = false;

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
              Get.to(SettingsPageOrganization());
            },
            icon: Image.asset("assets/Settings.png"),
          )
        ],
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  height: hight * .6,
                  width: width,
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 30,
                          width: width * .3,
                          decoration: BoxDecoration(
                              color: appThemeGrey,
                              borderRadius: BorderRadius.circular(49)),
                          child: Center(
                            child: customeText(
                                text: "Organization",
                                textcolor: blue,
                                size: 17),
                          ),
                        ),
                      ),
                      customeText(
                          text: storeInstence.orgnRegModel?.orgName, size: 24),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(50),
                          //   child: Container(
                          //       height: 100,
                          //       width: 100,
                          //       decoration: BoxDecoration(
                          //           image:
                          //               DecorationImage(image: imageNotFound))),
                          // ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        storeInstence.orgnRegModel?.image == ""
                                            ? imageNotFound
                                            : NetworkImage(storeInstence
                                                .orgnRegModel!.image!))),
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
                                    Get.to(
                                        const EditProfileImageOrganization());
                                  },
                                  child: const Icon(
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
                                customeText(text: "Contact no.", size: 20),
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
                                customeText(
                                    text: storeInstence.orgnRegModel!.orgName,
                                    size: 20),
                                customeText(
                                    text:
                                        "${storeInstence.orgnRegModel!.contactNumber}",
                                    size: 20),
                                customeText(
                                    text: storeInstence.orgnRegModel!.email,
                                    size: 20),
                                customeText(
                                    text: storeInstence.orgnRegModel!.location,
                                    size: 20),
                              ],
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, backgroundColor: appThemeGrey),
                          onPressed: () {
                            Get.to(EditProfileDetailOrganization());
                          },
                          child: customeText(
                              text: "Edit Profile", textcolor: black))
                    ],
                  ),
                ),
                const Gap(20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: customeText(text: "About Us", size: 25)),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: width,
                  height: isExpanded ? hight * .25 : hight * .1,
                  decoration: BoxDecoration(
                      color: appThemeGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        //
                        storeInstence.orgnRegModel!.about,
                        style: GoogleFonts.jua(fontSize: 13),
                        overflow: isExpanded
                            ? TextOverflow.clip
                            : TextOverflow.ellipsis,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: customeText(
                              text: isExpanded ? "read less" : "read more",
                              textcolor: grey600))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
