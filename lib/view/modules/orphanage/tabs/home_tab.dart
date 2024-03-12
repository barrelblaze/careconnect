// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/Notification_category_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/sendrequestPages/send_request_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_image_page.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class HomeTabOrphanage extends StatelessWidget {
  // OrphnRegModel orphnRegModel;
  HomeTabOrphanage({super.key, });
  List<Image> ImageList = [
    Image.asset("assets/Cash.png"),
    Image.asset("assets/Food Bar.png"),
    Image.asset("assets/Education.png"),
    Image.asset("assets/shirt.png"),
  ];
  List<Widget> textList = [
    customeText(text: "Funds", textcolor: white, size: 20),
    customeText(text: "Food", textcolor: white, size: 20),
    customeText(text: "Education", textcolor: white, size: 20),
    customeText(text: "Cloths", textcolor: white, size: 20)
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const NotificationCategoryPageOrphanage());
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 34,
              ))
        ],
        centerTitle: true,
        title: customeText(text: "Home"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        height: orientation == landScapeMode ? width : hight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customeText(text: "Your Orphanage", size: 24),
            const Gap(20),
            Container(
                height:
                    orientation == landScapeMode ? hight * .5 : hight * .29,
                width: width * .9,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appThemeGrey,
                ),
                child: Consumer<FireStore>(
                  builder: (context,firestore,child) {
                    return FutureBuilder(
              future:firestore.fetchorphan(FirebaseAuth.instance.currentUser!.uid) ,
              builder: (context,snapshot) {

                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center( child: CircularProgressIndicator(),);
                }
                        return Column(children: [
                          customeText(text:"${firestore.orphnRegModel?.orphnName}"),
                          Container(
                            width: width * .9,
                            height: orientation == landScapeMode
                                ? hight * .35
                                : hight * .21,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                            fit: BoxFit.fill,
                              image: storeInstence.orphnRegModel!.image!.isEmpty
                                  ? imageNotFound
                                  : NetworkImage("${firestore. orphnRegModel?.image}"),
                            )),
                          ),
                          SizedBox(
                            width: width * .4,
                            height: orientation == landScapeMode
                                ? hight * .08
                                : hight * .04,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(EditProfileImageOrphanage(
                                  // orphnRegModel: orphnRegModel,
                                ));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll(white),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20))),
                              ),
                              child: customeText(
                                  text: "View Profile", textcolor: black, size: 15),
                            ),
                          ),
                        ]);
                      }
                    );
                  }
                )),
            SizedBox(
              height: 30,
            ),
            customeText(text: "Request donation", size: 20),
            const Gap(20),
            SizedBox(
              height: orientation == landScapeMode ? hight * .6 : hight * .25,
              width: width,
              child: Center(
                child: GridView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: ImageList.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: width*.0016,
                      // mainAxisExtent: 100,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(SendRequestToUserOrphanage(passedIndex: index));
                    },
                    child: Container(
                    
                      
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 60, child: ImageList[index]),
                          textList[index]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
