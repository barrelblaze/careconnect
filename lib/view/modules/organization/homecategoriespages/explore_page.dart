import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';

import 'package:orphanagemanagement/view/modules/organization/explre_singleorphanage_page.dart';
import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class ExplorePageInHomeOrganization extends StatefulWidget {
  const ExplorePageInHomeOrganization({super.key});

  @override
  State<ExplorePageInHomeOrganization> createState() =>
      _ExplorePageInHomeOrganizationState();
}

class _ExplorePageInHomeOrganizationState
    extends State<ExplorePageInHomeOrganization> {
  @override
  Widget build(BuildContext context) {
    Provider.of<FireStore>(context, listen: false).fetchAllOrphanages();
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Consumer<FireStore>(builder: (context, firestore, child) {
          final data = firestore.orphanageList;
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
                    child: ListView.separated(
                        itemBuilder: (context, index) => exploreOrphanages(
                            onTap: () {
                              Get.to(ExploreSingleOrphanagePageOrganization(
                                orphId: data[index].orphnId,
                              ));
                            },
                            hight: hight,
                            width: width,
                            location: data[index].location,
                            orphnName: data[index].orphnName,
                            numOfChile: "${data[index].childCount}",
                            contNumber: "${data[index].contactNumber}",
                            srcimg: data[index].image == ""
                                ? 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg'
                                : data[index].image!),
                        separatorBuilder: (context, index) => Gap(20),
                        itemCount: data.length))
              ],
            ),
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Get.to(MainPageOrganization(selectedIndex: 0));
              } else if (index == 1) {
                Get.to(MainPageOrganization(selectedIndex: 1));
              } else {
                Get.to(MainPageOrganization(selectedIndex: 2));
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
      location,
      contNumber,
      required String srcimg,
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
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(srcimg)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              width: 150,
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
