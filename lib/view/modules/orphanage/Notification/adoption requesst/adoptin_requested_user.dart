
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/single_child_data_page.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class AdoptionRequestedUserProfileOrphanage extends StatelessWidget {
  dynamic slectedUID;
  dynamic userType;
  dynamic childInd;
  String adopId;
  AdoptionRequestedUserProfileOrphanage(
      {super.key,
      required this.adopId,
      required this.slectedUID,
      required this.userType,
      required this.childInd});

  @override
  Widget build(BuildContext context) {
  
  print(childInd);
    // if (userType == "Organization") {
    //   Provider.of<FireStore>(context, listen: false)
    //       .getSelectedOrganizationData(slectedUID);
    // } else if (userType == "Individual") {
    //   Provider.of<FireStore>(context, listen: false)
    //       .getSelectedIndividualData(slectedUID);
    // }
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
  
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: customeText(text: "Notification"),
        ),
        body: SingleChildScrollView(
          child: Consumer<FireStore>(builder: (context, firestore, child) {
    
    
    
            
           
            return FutureBuilder(
              future:userType == "Organization"?firestore.getSelectedOrganizationData(slectedUID):firestore.getSelectedIndividualData(slectedUID) ,
      builder: (context,snap) {
        if(snap.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
    
    //  if (userType == "Organization") {
    //           if (firestore.orgnRegModel?.orgName == null) {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //         } else if (userType == "individual") {
    //           if (firestore.indivRegModel?.name == null) {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //         }
              
                   
                    return Container(
                      height: orientation == landScapeMode ? width : hight,
                      width: width,
                      margin: const EdgeInsets.all(20),
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
                                          text: userType == "Individual"
                                              ? "Individual"
                                              : "Organization",
                                          textcolor: userType == "Individual"
                                              ? Colors.green
                                              : Colors.blue),
                                    ),
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
                                                image: userType == "Individual"
                                                    ?firestore.indivRegModel!.image.isEmpty? imageNotFound:NetworkImage(
                                                        firestore.indivRegModel!.image)
                                                    :firestore
                                                              .orgnRegModel!.image!.isEmpty? imageNotFound:NetworkImage(
                                                          firestore
                                                              .orgnRegModel!.image!,
                                                        ) )),
                                      ),
                                      const SizedBox(),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customeText(text: "Name", size: 16),
                                              customeText(
                                                  text: "Contact no.", size: 16),
                                              customeText(text: "Email", size: 16),
                                              customeText(text: "Location", size: 16),
                                            ],
                                          ),
                                          const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    text: userType == "Individual"
                                                        ? firestore.indivRegModel!.name
                                                        : firestore
                                                            .orgnRegModel!.orgName,
                                                    size: 16),
                                                customeText(
                                                    text: userType == "Individual"
                                                        ? "${firestore.indivRegModel!.contactNumber}"
                                                        : "${firestore.orgnRegModel!.contactNumber}",
                                                    size: 16),
                                                customeText(
                                                    text: userType == "Individual"
                                                        ? firestore.indivRegModel!.email
                                                        : firestore.orgnRegModel!.email,
                                                    size: 16),
                                                customeText(
                                                    text: userType == "Individual"
                                                        ? firestore
                                                            .indivRegModel!.location
                                                        : firestore
                                                            .orgnRegModel!.location,
                                                    size: 16),
                                              ])
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(30),
                                  easyButton(
                                    onpressed: (){
if(userType == "Individual"){
  print("${firestore.indivRegModel!.contactNumber}");
  launch("tel://${firestore.indivRegModel!.contactNumber}");
  
}else{
  print("${firestore.orgnRegModel!.contactNumber}");
  launch("tel://${firestore.orgnRegModel!.contactNumber}");
}


                                      // launchUrl(Uri.parse("tel://${userType == "Individual"
                                      //                   ? "${firestore.indivRegModel!.contactNumber}"
                                      //                   : "${firestore.orgnRegModel!.contactNumber}"}"));
                                      
                                    },
                                    context: context,
                                    text: "Contact now",
                                    fontWeight: FontWeight.w300,
                                    textcolor: grey600,
                                    bgColor: const MaterialStatePropertyAll(white),
                                  ),
                                  const Gap(30),
                                ],
                              ),
                            ),
                          ),
                          const Gap(20),
                          customeText(text: "Requested Child", size: 22),
                          const Gap(5),
                          FutureBuilder(
                            future:   firestore
    .fetchselectedAdoptionData(adopId),
                  builder: (context,snap) {
                    if(snap.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                          
                              return FutureBuilder(
                                future: firestore.fechSingleChildAllData(snap.data),

                                builder: (context,snapi) {
                                    if(snapi.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                                  return Container(
                                    height: hight * .2,
                                    width: width,
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: appThemeGrey,
                                        borderRadius: BorderRadius.circular(10)),
                                        child:  Container(
                                          
                                          height:hight * .1 ,
                                                decoration: BoxDecoration(
                                                  
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: white),
                                                child: ListTile(
                                                  leading: Container(
                                                    
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: firestore.childDataRegModel
                                                                        !.image.isEmpty
                                                                    
                                                                ? imageNotFound
                                                                : NetworkImage(
                                                                    "${firestore.childDataRegModel?.image}")),
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: white),
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                  title: Center(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                text: firestore
                                                                    .childDataRegModel?.name,
                                                                textcolor: grey600),
                                                            customeText(
                                                                text: firestore
                                                                    .childDataRegModel?.age
                                                                    .toString(),
                                                                textcolor: grey600),
                                                            customeText(
                                                                text: firestore
                                                                    .childDataRegModel?.gender,
                                                                textcolor: grey600)
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  trailing: IconButton(
                                                      onPressed: () {
                                                        Get.to(() => SingleChildDataOrphanage(
                                                              childId: childInd,
                                                            ));
                                                      },
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios_rounded,
                                                        size: 20,
                                                        color: grey600,
                                                      )),
                                                ),
                                              ),
                                    // child: ListView.separated(
                                    //     itemBuilder: (context, index) => InkWell(
                                    //           onTap: () {
                                    //             // Get.to(EditOrDeleteSingleChildDataPageOrphanage());
                                    //           },
                                    //           child:
                                    //         ),
                                    //     separatorBuilder: (context, index) => const Gap(20),
                                    //     itemCount: 1),
                                  );
                                }
                              );
                            }
                          )
                        ],
                      ),
                    );
                  
              }
            );
          }),
        ));
  }
}
