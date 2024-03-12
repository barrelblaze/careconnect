import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/editchild_details.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/childdetails_tab.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class SingleChildDataOrphanage extends StatelessWidget {
  dynamic childId;
  SingleChildDataOrphanage({super.key, required this.childId});

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Provider.of<FireStore>(context, listen: false)
    //     .fechSingleChildAllData(childId);
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Child Details"),
      ),
      body: Consumer<FireStore>(builder: (context, firestore, child) {
        return FutureBuilder(
          future:firestore. fechSingleChildAllData(childId),
          builder: (context,snapshot) {
  if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }



            return Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: storeInstence.childDataRegModel?.image == null
                                  ? imageNotFound
                                  : NetworkImage(
                                      "${firestore.childDataRegModel?.image}"))),
                    ),
                    Gap(4),
                    customeText(
                        text: "(photo optional)",
                        textcolor: appThemeGrey,
                        size: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 480,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeText(text: "Name", size: 16),
                                  customeText(text: "Nick Name.", size: 16),
                                  customeText(text: "Age", size: 16),
                                  customeText(text: "Gender", size: 16),
                                  customeText(text: "Birth Date", size: 16),
                                  customeText(text: "Joined Date", size: 16),
                                  customeText(text: "Known location", size: 16),
                                  customeText(text: "Bkood Group", size: 16),
                                  customeText(text: "Orphan Type", size: 16),
                                  customeText(text: "Ready For Adoption", size: 16),
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
                                  seperatorText,
                                  seperatorText,
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
                                      text: "${firestore.childDataRegModel?.name}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.nickNmae}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.age} Years",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.gender}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.dirthdate}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.joinDate}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.location}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.bloodGroup}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.orphanType}",
                                      size: 16),
                                  customeText(
                                      text:
                                          "${firestore.childDataRegModel?.adoptionStatus}",
                                      size: 16),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: appThemeGrey,
                          borderRadius: BorderRadius.circular(13)),
                      height: hight * .4,
                      child: Column(
                        children: [
                          customeText(text: "Health Report", size: 17),
                          const Divider(
                            color: Black54,
                          ),
                          SizedBox(
                            height: 290,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customeText(text: "Medical Status", size: 16),
                                    customeText(text: "Diseases", size: 16),
                                    customeText(text: "Disabilities", size: 16),
                                    customeText(text: "Hight", size: 16),
                                    customeText(text: "Weight", size: 16),
                                    customeText(text: "Medicines", size: 16),
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
                                    seperatorText,
                                    seperatorText,
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    customeText(
                                        text:
                                            "${firestore.childHealthReportModel?.medicalStatus}",
                                        size: 16),
                                    customeText(
                                        text:
                                            "${firestore.childHealthReportModel?.diseases}",
                                        size: 16),
                                    customeText(
                                        text:
                                            "${firestore.childHealthReportModel?.disabilities}",
                                        size: 16),
                                    customeText(
                                        text:
                                            "${firestore.childHealthReportModel?.heght}",
                                        size: 16),
                                    customeText(
                                        text:
                                            "${firestore.childHealthReportModel?.weight}",
                                        size: 16),
                                    customeText(
                                        text:
                                            "${firestore.childHealthReportModel?.medicines}",
                                        size: 16),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Gap(20),
                    SizedBox(
                      width: width * .5,
                      height: hight * .05,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(EditChildDetailPageOrphanage(
                              childID: childId,childDataRegModel: firestore.childDataRegModel!,childHealthReportModel: firestore.childHealthReportModel!,
            
                            ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(appThemeGrey),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/whitepencil.png"),
                              customeText(
                                  text: "Edit/Update",
                                  textcolor: grey600,
                                  size: 20),
                            ],
                          )),
                    ),
                    Gap(20),
                    SizedBox(
                      width: width * .5,
                      height: hight * .05,
                      child: OutlinedButton(
                          onPressed: () {
                            storeInstence.removeChild(childId);
                            Get.to(() => ChildDetailsTabOrphanage());
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0))),
                              side: MaterialStatePropertyAll(
                                  BorderSide(color: Colors.red))),
                          child: customeText(
                              text: "Remove Child", textcolor: Colors.red)),
                    )
                  ],
                ),
              ),
            );
          }
        );
      }),
    );
  }
}
