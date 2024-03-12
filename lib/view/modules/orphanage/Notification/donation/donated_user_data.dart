import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatedUserProfileOrphanage extends StatefulWidget {
  String userType;
  String selectedUId;
  DonatedUserProfileOrphanage(
      {super.key, required this.userType, required this.selectedUId});

  @override
  State<DonatedUserProfileOrphanage> createState() =>
      _DonatedUserProfileOrphanageState();
}

class _DonatedUserProfileOrphanageState
    extends State<DonatedUserProfileOrphanage> {
  bool isUserNotIndividual = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    print(widget.selectedUId);
    // if (widget.userType == "Organization") {
    //   Provider.of<FireStore>(context, listen: false)
    //       .getSelectedOrganizationData(widget.selectedUId);
    // } else if (widget.userType == "Individual") {
    //   Provider.of<FireStore>(context, listen: false)
    //       .getSelectedIndividualData(widget.selectedUId);
    // }

    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Notification"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Consumer<FireStore>(builder: (context, firestore, child) {
          
          return FutureBuilder(
            future:widget.userType == "Organization"?firestore.getSelectedOrganizationData(widget.selectedUId):firestore.getSelectedIndividualData(widget.selectedUId) ,
            builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              if (widget.userType == "Organization") {
            if (firestore.orgnRegModel?.orgName == null ||
                firestore.orgnRegModel!.orgName.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (widget.userType == "individual") {
            if (firestore.indivRegModel?.name == null ||
                firestore.indivRegModel!.name.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(text: "User Profile", size: 22),
                    const Gap(20),
                    Card(
                      elevation: 0,
                      color: appThemeGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white),
                              child: Center(
                                  child: customeText(
                                text: widget.userType,
                                textcolor:
                                    widget.userType == "Individual" ? green : blue,
                              )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: widget.userType == "Individual"
                                              ?firestore.indivRegModel!.image.isEmpty?imageNotFound: NetworkImage(
                                                  "${firestore.indivRegModel?.image}")
                                              :firestore.orgnRegModel!.image!.isEmpty?imageNotFound: NetworkImage(
                                                      "${firestore.orgnRegModel?.image}")
                                                  )),
                                ),
                                const SizedBox(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customeText(text: "Name", size: 16),
                                        customeText(text: "Contact no.", size: 16),
                                        customeText(text: "Email", size: 16),
                                        customeText(text: "Location", size: 16),
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
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customeText(
                                              text: widget.userType == "Individual"
                                                  ? firestore.indivRegModel?.name
                                                  : firestore.orgnRegModel?.orgName,
                                              size: 16),
                                          customeText(
                                              text: widget.userType == "Individual"
                                                  ? "${firestore.indivRegModel?.contactNumber}"
                                                  : "${firestore.orgnRegModel?.contactNumber}",
                                              size: 16),
                                          customeText(
                                              text: widget.userType == "Individual"
                                                  ? firestore.indivRegModel?.email
                                                  : firestore.orgnRegModel?.email,
                                              size: 16),
                                          customeText(
                                              text: widget.userType == "Individual"
                                                  ? firestore
                                                      .indivRegModel?.location
                                                  : firestore
                                                      .orgnRegModel?.location,
                                              size: 16),
                                        ])
                                  ],
                                ),
                              ),
                            ),
                            const Gap(30),
                            easyButton(
                              onpressed: () {
                                if(widget. userType == "Individual"){
  print("${firestore.indivRegModel!.contactNumber}");
  launch("tel://${firestore.indivRegModel!.contactNumber}");
  
}else{
  print("${firestore.orgnRegModel!.contactNumber}");
  launch("tel://${firestore.orgnRegModel!.contactNumber}");
}

                              },
                              context: context,
                              text: "Contact now",
                              fontWeight: FontWeight.w300,
                              textcolor: grey600,
                              bgColor: MaterialStatePropertyAll(white),
                            ),
                            const Gap(30),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    widget.userType == "Organization"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "About Us", size: 22),
                              const Gap(20),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                width: width,
                                height: isExpanded ? hight * .2 : hight * .1,
                                decoration: BoxDecoration(
                                    color: appThemeGrey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      firestore.orgnRegModel!.about,
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
                                            text: isExpanded
                                                ? "read less"
                                                : "read more",
                                            textcolor: grey600))
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              );
            }
          );
        }),
      ),
    );
  }
}
