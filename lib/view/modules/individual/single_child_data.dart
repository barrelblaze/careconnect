import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/model/other_models/adoption_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class SingleChildDataIndividual extends StatefulWidget {
  dynamic selectedChildId;
  SingleChildDataIndividual({super.key, required this.selectedChildId});

  @override
  State<SingleChildDataIndividual> createState() =>
      _SingleChildDataIndividualState();
}

class _SingleChildDataIndividualState extends State<SingleChildDataIndividual> {
  bool isExpanded = false;
String time = DateFormat('h:mm a').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    Provider.of<FireStore>(context, listen: false)
        .fechSingleChildAllData(widget.selectedChildId);
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Consumer<FireStore>(builder: (context, firestore, child) {
          final childData = firestore.childDataRegModel;
          final healthData = firestore.childHealthReportModel;
          return childData?.age==null?Center(child: CircularProgressIndicator(),):
           Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(60),
                  Align(
                      alignment: Alignment.topLeft,
                      child: customeText(text: "Child Details", size: 28)),
                  const Gap(20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset(
                          "assets/leftarrow.png",
                          scale: 20,
                        )),
                  ),
                  const Gap(20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: width * .28,
                      height: hight * .1,
                      decoration: BoxDecoration(
                          color: blue,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: childData!.image.isEmpty
                                  ? imageNotFound
                                  : NetworkImage(childData.image))),
                    ),
                  ),
                  Gap(4),
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
                                customeText(
                                  text: "Name",
                                  size: 20,
                                ),
                                customeText(text: "Nick Name.", size: 20),
                                customeText(text: "Age", size: 20),
                                customeText(text: "Gender", size: 20),
                                customeText(text: "Birth Date", size: 20),
                                customeText(text: "Joined Date", size: 20),
                                customeText(text: "Known location", size: 20),
                                customeText(text: "Bkood Group", size: 20),
                                customeText(text: "Orphan Type", size: 20),
                                customeText(
                                    text: "Ready For Adoption", size: 20),
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
                                  text: childData.name,
                                  size: 20,
                                ),
                                customeText(text: childData.nickNmae, size: 20),
                                customeText(text: "${childData.age}", size: 20),
                                customeText(text: childData.gender, size: 20),
                                customeText(
                                    text: childData.dirthdate, size: 20),
                                customeText(text: childData.joinDate, size: 20),
                                customeText(text: childData.location, size: 20),
                                customeText(
                                    text: childData.bloodGroup, size: 20),
                                customeText(
                                    text: childData.orphanType, size: 20),
                                customeText(
                                    text: childData.adoptionStatus, size: 20),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: appThemeGrey,
                        borderRadius: BorderRadius.circular(13)),
                    height: hight * .38,
                    child: Column(
                      children: [
                        const Gap(15),
                        customeText(text: "Health Report", size: 17),
                        const Divider(
                          color: Black54,
                        ),
                        SizedBox(
                          height: 290,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeText(text: "Medical Status", size: 20),
                                  customeText(text: "Diseases", size: 20),
                                  customeText(text: "Disabilities", size: 20),
                                  customeText(text: "Hight", size: 20),
                                  customeText(text: "Weight", size: 20),
                                  customeText(text: "Medicines", size: 20),
                                ],
                              ),
                              const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeText(
                                      text: healthData?.medicalStatus,
                                      size: 20),
                                  customeText(
                                      text: healthData?.diseases, size: 20),
                                  customeText(
                                      text: healthData?.disabilities, size: 20),
                                  customeText(
                                      text: healthData?.heght, size: 20),
                                  customeText(
                                      text: healthData?.weight, size: 20),
                                  customeText(
                                      text: healthData?.medicines, size: 20),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(40),
                  customeGradientButtom(
                      onpressed: () {
                        serviceProviderinstence.addAdoptionRequestToFirebase(
                            AdoptionModel(
                              userType: "Individual",
                              image:storeInstence.indivRegModel!.image, 
                              dataAndDay: "$date $day",
                              time: time,
                                childId: widget.selectedChildId,
                                reqStatus: "REQUESTED",
                                senderId: currentUserId),context);
                        Get.back();
                        // Get.to(MainTabIndividual());
                      },
                      context: context,
                      text: "Request Adoption",
                      fontWeight: FontWeight.w400,
                      textcolor: white,
                      bgColor: const MaterialStatePropertyAll(black)),
                  Gap(40),
                  customeText(text: "Send a request for adoption of this child")
                ],
              ),
            ),
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
