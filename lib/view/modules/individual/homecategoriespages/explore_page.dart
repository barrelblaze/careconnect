import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/individual/explre_singleorphanage_page.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class ExplorePageInHomeIndividual extends StatefulWidget {
  const ExplorePageInHomeIndividual({super.key});

  @override
  State<ExplorePageInHomeIndividual> createState() =>
      _ExplorePageInHomeIndividualState();
}

class _ExplorePageInHomeIndividualState
    extends State<ExplorePageInHomeIndividual> {
  @override
  Widget build(BuildContext context) {
    

    // storeInstence.fetchAllOrphanages();
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Consumer<FireStore>(builder: (context, firestore, child) {
          return FutureBuilder(
            future: firestore.fetchAllOrphanages(),

            builder: (context,snap) {
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              return Container(
                height: hight,
                width: width,
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(60),
                    customeText(text: "Home", size: 26),
                    Gap(20),
                    customeTextField(
                      onSubmitted: (value) {
                        // OrphnRegModel searchUserByName(String searchName) {
                        //   return firestore.orphanageList.firstWhere(
                        //     (element) =>
                        //         element.orphnName.toLowerCase() ==
                        //         searchName.toLowerCase(),
                        //     orElse: () => null,
                        //   ); // Ret)
                        //   // return firestore.orphanageList.firstWhere(
                        //   //   (user) => user..toLowerCase() == searchName.toLowerCase(),
                        //   //   orElse: () => null, // Return null if not found
                        //   // );
                        // }
                      },
                      controller: firestore.serchController,
                      prefixicon: Image.asset(
                        "assets/search.png",
                        scale: 20,
                      ),
                      radius: 30,
                      fillcolor: appThemeGrey,
                      hintText: 'Search an orphanage',
                    ),
                    const Gap(20),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset(
                          "assets/leftarrow.png",
                          scale: 20,
                        )),
                    customeText(text: "Explore", size: 22),
                    const Gap(15),
                    Expanded(
                        child:firestore.orphanageList.isEmpty?Center(child: Text("No data"),) :ListView.separated(
                            itemBuilder: (context, index) => exploreOrphanages(
                                location: firestore.orphanageList[index].location,
                                onTap: () {
                                  Get.to(ExploreSingleOrphanagePafeIndividual(
                                    orphnId: firestore.orphanageList[index].orphnId,
                                  ));
                                },
                                hight: hight,
                                width: width,
                                orphnName: firestore.orphanageList[index].orphnName,
                                numOfChile: firestore
                                    .orphanageList[index].childCount
                                    .toString(),
                                contNumber: firestore
                                    .orphanageList[index].contactNumber
                                    .toString(),
                                srcimg:
                                    firestore.orphanageList[index].image!.isEmpty
                                        ? imageNotFound
                                        : NetworkImage(
                                            firestore.orphanageList[index].image!)),
                            separatorBuilder: (context, index) => Gap(20),
                            itemCount: firestore.orphanageList.length))
                  ],
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

  Widget exploreOrphanages(
      {hight,
      width,
      orphnName,
      numOfChile,
      contNumber,
      location,
      required dynamic srcimg,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appThemeGrey,
        ),
        height: hight * .15,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(fit: BoxFit.fill, image: srcimg)),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customeText(text: orphnName, size: 18),
                  customeText(text: numOfChile, textcolor: grey600),
                  customeText(text: contNumber, textcolor: grey600),
                  SizedBox(
                    child: Row(children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: blue,
                      ),
                      customeText(text: location, textcolor: blue)
                    ]),
                  )
                ],
              ),
            ),
            Gap(10),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: grey600,
                ))
          ],
        ),
      ),
    );
  }
}
