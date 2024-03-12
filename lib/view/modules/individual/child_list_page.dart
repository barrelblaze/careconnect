import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/individual/single_child_data.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/add_child_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/single_child_data_page.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class ChildListPageIndividual extends StatefulWidget {
  String orpId;
  // dynamic childcount;
  ChildListPageIndividual({super.key,required this.orpId});

  @override
  State<ChildListPageIndividual> createState() =>
      _ChildListPageIndividualState();
}

class _ChildListPageIndividualState extends State<ChildListPageIndividual> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<FireStore>(context, listen: false).fetchAllChildinfo();
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
        body: Consumer<FireStore>(builder: (context, firestore, child) {

         
         
          return   FutureBuilder(
            future:firestore. fetchSelectedOrpahanageChilds(widget.orpId),
            builder: (context,snapshot) {
                 if(snapshot.connectionState==ConnectionState.waiting){
                  return Center( child: CircularProgressIndicator(),);
                }
                 final length =firestore.currentOrphanChildList.length;
              // firestore.orphnRegModel!.childCount<= widget.childcount
              //     ? firestore.orphnRegModel?.childCount
              //     : widget.childcount;
          final childData = firestore.currentOrphanChildList;
              return childData.isEmpty?Center(child: CircularProgressIndicator(),) :Container(
                height: hight,
                width: width,
                margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(60),
                    customeText(text: "Child List", size: 28),
                    const Gap(20),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset(

                          
                          "assets/leftarrow.png",
                          scale: 20,
                        )),
                    customeText(
                        text: "Toatal no :${length}",
                        size: 20,
                        textcolor: grey600),
                    const Gap(20),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Get.to(SingleChildDataIndividual(
                                      selectedChildId: childData[index].childId,
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: appThemeGrey),
                                    child: ListTile(
                                      leading: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: childData[index]
                                                        .image
                                                        .isEmpty
                                                    ? imageNotFound
                                                    : NetworkImage(
                                                        childData[index].image)),
                                            borderRadius: BorderRadius.circular(10),
                                            color: blue),
                                        height: 60,
                                        width: 60,
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customeText(
                                                  text: "Name", textcolor: grey600),
                                              customeText(
                                                  text: "Age", textcolor: grey600),
                                              customeText(
                                                  text: "Gender",
                                                  textcolor: grey600)
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customeText(
                                                  text: ":", textcolor: grey600),
                                              customeText(
                                                  text: ":", textcolor: grey600),
                                              customeText(
                                                  text: ":", textcolor: grey600)
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customeText(
                                                  text: childData[index].name,
                                                  textcolor: grey600),
                                              customeText(
                                                  text: "${childData[index].age}",
                                                  textcolor: grey600),
                                              customeText(
                                                  text: childData[index].gender,
                                                  textcolor: grey600)
                                            ],
                                          )
                                        ],
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 20,
                                            color: grey600,
                                          )),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) => const Gap(20),
                            itemCount: length))
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
}
