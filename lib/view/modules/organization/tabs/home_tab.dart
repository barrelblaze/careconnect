import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/organization/homecategoriespages/explore_page.dart';
import 'package:orphanagemanagement/view/modules/organization/homecategoriespages/supporting_page.dart';

class HomeTabOrganization extends StatelessWidget {
  const HomeTabOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
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
              Gap(30),
              customeTextField(
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
                    Get.to(ExplorePageInHomeOrganization());
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
                    Get.to(SupportingPageOrganization());
                  },
                  hight: hight,
                  width: width,
                  headText: "Tap to view orphanages you support",
                  srcimg: supporting),
              const Gap(15),
              // customeText(text: "Save a child", size: 22),
              // const Gap(15),
              // hometabs(
              //     onTap: () {
              //       Get.to(SaveChildPageIndividual());
              //     },
              //     hight: hight,
              //     width: width,
              //     headText: "Tap to explore new Orphanages",
              //     srcimg:
              //         "https://s3-alpha-sig.figma.com/img/740c/ba84/379a5cd719f09f2b12726a3e96bae3b5?Expires=1702252800&Signature=I90fy6BcFnZuYAb3YjGq3iLuqbUvn8RRg2yV-WP-x546aT~Axq0RbJg07rzQ4itYHfKtC-Zm4b6W3-24op4v4Ke4H75cv6e~AXLV8QxHf98wIf8gIeWsw8ZmmBVOeertOLijzr5kdjT7F32Olx~M50d8uOZgJUNm~n5AxCp5U0vBioUnGJi-WIGCx0kuxYkDXXKQ4B1m-WZgvgOpLjX7yjJ7Tjcte7fRecPTiolUONmKeVdvfgeNBMxW~Bft0SFmy-nKScwebLQPryXdqcRHx0BdAPOxm1nUczpuBKsuY6gzBuE9xZ3H1oc5XLp~FSZ0Rk8DgVwhAB843jLVK4Qc~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              // const Gap(20)
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
                //   child: Image.network(
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
