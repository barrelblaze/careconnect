import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/model/other_models/supporting_orphn_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/child_list_page.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_page.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/supporting_preference.dart';
import 'package:provider/provider.dart';

class ExploreSingleOrphanagePafeIndividual extends StatefulWidget {
  dynamic orphnId;
  ExploreSingleOrphanagePafeIndividual({super.key, required this.orphnId});

  @override
  State<ExploreSingleOrphanagePafeIndividual> createState() =>
      _ExploreSingleOrphanagePafeIndividualState();
}

class _ExploreSingleOrphanagePafeIndividualState
    extends State<ExploreSingleOrphanagePafeIndividual> {
  bool isExpanded = false;
  bool isSupporting = false;
  @override
  Widget build(BuildContext context) {
    // Provider.of<FireStore>(context, listen: false)
    //     .getSelectedOrphanageData(widget.orphnId);

    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Consumer<FireStore>(builder: (context, firestore, child) {
         
          return FutureBuilder(
            future: firestore.getSelectedOrphanageData(widget.orphnId),
            builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
               final orphnData = firestore.orphnRegModel;
          final bankData = firestore.bankDetailModel;
              return Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(60),
                            customeText(text: "Orphanage", size: 26),
                            Gap(40),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Image.asset(
                                  "assets/leftarrow.png",
                                  scale: 20,
                                )),
                            // const Divider(),
                            const Gap(
                              20,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: customeText(
                                    text: firestore.orphnRegModel!.orphnName,
                                    size: 22,
                                    textcolor: grey600)),
                            Container(
                                width: width * .9,
                                height: hight * .25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: firestore.orphnRegModel!.image!.isEmpty?imageNotFound: NetworkImage(
                                            firestore.orphnRegModel!.image!))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, top: 20),
                                      child: Container(
                                        height: 30,
                                        width: width * .3,
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                            child: customeText(
                                                text: "More images",
                                                textcolor: grey600,
                                                size: 18)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 30, right: 30),
                                      decoration: BoxDecoration(
                                          color: appThemeGrey,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20))),
                                      height: 60,
                                      width: width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              customeText(
                                                  text: "",
                                                  textcolor: blue,
                                                  size: 30),
                                              customeText(
                                                  text: "Supports",
                                                  textcolor: grey600,
                                                  size: 15),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              customeText(
                                                  text: "${orphnData?.childCount}",
                                                  textcolor: blue,
                                                  size: 30),
                                              customeText(
                                                  text: "Children",
                                                  textcolor: grey600,
                                                  size: 15),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              customeText(
                                                  text: "",
                                                  textcolor: blue,
                                                  size: 30),
                                              customeText(
                                                  text: "Workers",
                                                  textcolor: grey600,
                                                  size: 15),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            const Gap(30),
                            // customeGradientButtom(
                            //     onpressed: () {
                            //       setState(() {
                            //         isSupporting = !isSupporting;
                            //       });
                            //     },
                            //     context: context,
                            //     text: isSupporting ? "Supporting" : "Support",
                            //     fontWeight: FontWeight.w400,
                            //     textcolor: white,
                            //     bgColor: const MaterialStatePropertyAll(black)),
              
                            InkWell(
                              onTap: () {
                                storeInstence.addSupportOrphanageInIndividual(
                                   
                                    widget.orphnId,
                                    SupportingOrphanModel(
                                        contactNumber:
                                            "${orphnData!.contactNumber}",
                                        isSupporting: "true",
                                        image: "${orphnData.image}",
                                        location: "${orphnData.location}",
                                        name: "${orphnData.orphnName}",
                                        numberOfChild: "${orphnData.childCount}"));
                                // SupportOrphaange.supportBoth(
                                //     bankModel: bankData,
                                //     orphnModel: orphnData,
                                //     selectedOrphnId: widget.orphnId);
              
                                // SupportOrphaange.settoList();
              
                                setState(() {
                                  isSupporting = !isSupporting;
                                });
                                // Get.to(ChildListPageIndividual());
                              },
                              child: Container(
                                height: hight * .06,
                                width: width,
                                decoration: BoxDecoration(
                                  gradient: isSupporting
                                      ? null
                                      : LinearGradient(colors: [green, blue]),
                                  borderRadius: BorderRadius.circular(50),
                                  border: GradientBoxBorder(
                                      width: 1.5,
                                      gradient:
                                          LinearGradient(colors: [green, blue])),
                                ),
                                child: Center(
                                    child: customeText(
                                        text:
                                            isSupporting ? "Supporting" : "Support",
                                        textcolor: isSupporting ? grey600 : white,
                                        size: 22,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            const Gap(40),
                            InkWell(
                              onTap: () {
                                Get.to(ChildListPageIndividual(
                                  orpId: firestore.orphnRegModel?.orphnId,
                                ));
                              },
                              child: Container(
                                height: hight * .06,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: GradientBoxBorder(
                                      width: 1.5,
                                      gradient:
                                          LinearGradient(colors: [green, blue])),
                                ),
                                child: Center(
                                    child: customeText(
                                        text: "View Child List",
                                        textcolor: grey600,
                                        size: 22,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Gap(40),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: customeText(text: "About Us", size: 25)),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 10),
                              width: width,
                              height: isExpanded ? hight * .25 : hight * .1,
                              decoration: BoxDecoration(
                                  color: appThemeGrey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    firestore.orphnRegModel!.about,
                                    style: GoogleFonts.jua(fontSize: 13),
                                    overflow: isExpanded
                                        ? TextOverflow.clip
                                        : TextOverflow.ellipsis,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        child: customeText(
                                            text: isExpanded
                                                ? "read less"
                                                : "read more",
                                            textcolor: grey600)),
                                  )
                                ],
                              ),
                            ),
                            Gap(20),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              height: hight * .27,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  customeText(text: "More details", size: 17),
                                  const Divider(),
                                  SizedBox(
                                    height: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customeText(
                                                text: "Number of Children",
                                                size: 16),
                                            customeText(
                                                text: "Contact no.", size: 16),
                                            customeText(text: "Email", size: 16),
                                            customeText(text: "Location", size: 16),
                                          ],
                                        ),
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            seperatorText,
                                            seperatorText,
                                            seperatorText,
                                            seperatorText,
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customeText(
                                                text: "${orphnData?.childCount}",
                                                size: 16),
                                            customeText(
                                                text: "${orphnData?.contactNumber}",
                                                size: 16),
                                            customeText(
                                                text: "${orphnData?.email}",
                                                size: 16),
                                            customeText(
                                                text: "${orphnData?.location}",
                                                size: 16),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              // margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: appThemeGrey,
                                  borderRadius: BorderRadius.circular(13)),
                              height: hight * .27,
                              child: Column(
                                children: [
                                  customeText(text: "Bank details", size: 17),
                                  const Divider(
                                    color: Black54,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customeText(text: "Bank", size: 16),
                                            customeText(
                                                text: "Account no.", size: 16),
                                            customeText(
                                                text: "E-payment no.", size: 16),
                                            customeText(
                                                text: "Contact no.", size: 16),
                                          ],
                                        ),
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            seperatorText,
                                            seperatorText,
                                            seperatorText,
                                            seperatorText,
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            customeText(
                                                text: bankData?.bank, size: 16),
                                            customeText(
                                                text: bankData?.accountNumber,
                                                size: 16),
                                            customeText(
                                                text: bankData?.epaymentnumber,
                                                size: 16),
                                            customeText(
                                                text: "${bankData?.contactNumber}",
                                                size: 16),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              );
            }
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Get.to(MainPageIndividual(selectedIndex: 0));
              } else if (index == 1) {
                Get.to(MainPageIndividual(selectedIndex: 1));
              } else {
                Get.to(MainPageIndividual(selectedIndex: 2));
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
}
