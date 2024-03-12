import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/add_child_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/single_child_data_page.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class ChildDetailsTabOrphanage extends StatefulWidget {
  const ChildDetailsTabOrphanage({super.key});

  @override
  State<ChildDetailsTabOrphanage> createState() =>
      _ChildDetailsTabOrphanageState();
}

class _ChildDetailsTabOrphanageState extends State<ChildDetailsTabOrphanage> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<FireStore>(context, listen: false).fetchAllChildinfo();
    print("--------page--------");

    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FireStore>(builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Image.asset("assets/userAppbar.png"),
          centerTitle: true,
          title: customeText(
            text: "Child details",
          ),
        ),
        body: Consumer<FireStore>(
          builder: (context,firestore,child) {
            return FutureBuilder(
              future: firestore.fetchSelectedOrpahanageChilds(FirebaseAuth.instance.currentUser!.uid),
              builder: (context,snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                return Container(
                  height: hight,
                  width: width,
                  margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      customeText(
                        text:
                              "Toatal no : ${controller.currentOrphanChildList.length}",
                          // text:
                          //     "Toatal no : ${storeInstence.orphnRegModel!.childCount > controller.currentOrphanChildList.length ? controller.currentOrphanChildList.length : storeInstence.orphnRegModel?.childCount}",
                          size: 20,
                          textcolor: grey600),
                      const Gap(20),
                      Expanded(
                          child: ListView.separated(
                        itemBuilder: (context, index) {
                          final value = controller.currentOrphanChildList[index];
                          return controller.currentOrphanChildList.isEmpty?Center(child: Text("No Data"),): InkWell(
                            onTap: () {
                              Get.to(() => SingleChildDataOrphanage(
                                    childId: value.childId,
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appThemeGrey),
                              child: ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: white),
                                    height: 60,
                                    width: 60,
                                    child: controller.currentOrphanChildList[index].image.isEmpty
                                        ? Image.asset(
                                            "assets/user_.png",
                                          )
                                        : Image.network(
                                            controller.currentOrphanChildList[index].image)),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customeText(text: "Name", textcolor: grey600),
                                        customeText(text: "Age", textcolor: grey600),
                                        customeText(text: "Gender", textcolor: grey600)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customeText(text: ":", textcolor: grey600),
                                        customeText(text: ":", textcolor: grey600),
                                        customeText(text: ":", textcolor: grey600)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customeText(
                                            text: value.name, textcolor: grey600),
                                        customeText(
                                            text: value.age.toString(),
                                            textcolor: grey600),
                                        customeText(
                                            text: value.gender, textcolor: grey600)
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
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(20),
                        itemCount: controller.currentOrphanChildList.length,
                        // itemCount: storeInstence.orphnRegModel!.childCount >
                        //         controller.currentOrphanChildList.length
                        //     ? controller.currentOrphanChildList.length
                        //     : storeInstence.orphnRegModel!.childCount,
                      ))
                    ],
                  ),
                );
              }
            );
          }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.all(20),
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(AddChildOrphanage());
            },
            elevation: 0,
            backgroundColor: appThemeGrey,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/addUser_.png")),
          ),
        ),
      );
    });
  }
}
