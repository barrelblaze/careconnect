import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/individual/homecategoriespages/explore_page.dart';
import 'package:orphanagemanagement/view/modules/individual/homecategoriespages/save_child_page.dart';
import 'package:orphanagemanagement/view/modules/individual/homecategoriespages/supporting_page.dart';

class HomeTabIndividual extends StatelessWidget {
  const HomeTabIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: customeText(text: "Home", size: 26),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              customeTextField(
                keyboardType: TextInputType.none,
                onTap: () => Get.to(() => const ExplorePageInHomeIndividual()),
                prefixicon: Image.asset(
                  "assets/search.png",
                  scale: 20,
                ),
                radius: 30,
                fillcolor: appThemeGrey,
                hintText: 'Search an orphanage',
              ),
              Gap(70),
              customeText(text: "Explore", size: 22),
              const Gap(15),
              hometabs(
                  onTap: () {
                    Get.to(ExplorePageInHomeIndividual());
                  },
                  hight: hight,
                  width: width,
                  headText: "Tap to explore new Orphanages",
                  srcimg: explore),
              const Gap(15),
              customeText(text: "Supporting", size: 22),
              const Gap(15),
              hometabs(
                onTap: () {
                  Get.to(SupportingPageInHomeIndividual());
                },
                hight: hight,
                width: width,
                headText: "Tap to view orphanages you support",
                srcimg: supporting,
              ),
              const Gap(15),
              // customeText(text: "Save a child", size: 22),
              // const Gap(15),
              // hometabs(
              //     onTap: () {
              //       Get.to(SaveChildPageIndividual());
              //     },
              //     hight: hight,
              //     width: width,
              //     headText: "Tap to Save child",
              //     srcimg:savechild),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }

  Widget hometabs(
      {hight, width, headText, required Widget srcimg, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appThemeGrey,
        ),
        height: hight * .25,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customeText(text: headText, textcolor: grey600),
                srcimg
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Image.asset(
                //     srcimg,
                //     scale: 10,
                //   ),
                // ),
              ],
            ),
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
