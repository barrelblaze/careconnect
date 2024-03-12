import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/adoption%20requesst/adoptin_requested_user.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';
import 'package:provider/provider.dart';

class AdoptionRequestNotifiOrphanage extends StatelessWidget {
  AdoptionRequestNotifiOrphanage({super.key});
  // String time = DateFormat('h:mm a').format(DateTime.now());
  // String day = DateFormat('EEEE').format(DateTime.now());
  // String date = DateFormat("dd/m/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    // Provider.of<ServiceProvider>(context, listen: false)
    //     .fetchAllAdoptionRequests(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: customeText(text: "Notification"),
        ),
        body: Consumer<ServiceProvider>(builder: (context, service, child) {
          return Container(
              margin: const EdgeInsets.all(20),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    customeText(text: "Adoption request", size: 22),
                    const Gap(20),
                    Expanded(
                      child:service.adoptionReqList.isEmpty?SizedBox(child: Center(child: customeText(text:"Data Not Found", textcolor: grey600, size: 10),),) :ListView.separated(
                          itemBuilder: (context, index) => adoptionRequest(
                              ontap: () {
                                Get.to(AdoptionRequestedUserProfileOrphanage(
                                  adopId: service.adoptionReqList[index].adoptionId!,
                                  userType: service.adoptionReqList[index].userType,
                                  slectedUID: service.adoptionReqList[index].senderId,
                                  childInd: service.adoptionReqList[index].childId,
                                ));
                              },
                              userImage:
                                  service.adoptionReqList[index].image == ""
                                      ? imageNotFound
                                      : NetworkImage(
                                          service.adoptionReqList[index].image),
                              requestText:
                                  "Useruserr requested for adoption - of a child",
                              dateAndDay:
                                  service.adoptionReqList[index].dataAndDay,
                              time: service.adoptionReqList[index].time),
                          separatorBuilder: (context, index) => Gap(30),
                          itemCount: service.adoptionReqList.length),
                    )
                  ]));
        }));
  }

  Widget adoptionRequest(
      {userImage, String? requestText, dateAndDay, time, Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 102,
        decoration: BoxDecoration(
            color: appThemeGrey, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            customeText(textcolor: grey600, text: "${dateAndDay}", size: 10),
            Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      // borderRadius: BorderRadius.circular(39),
                      image:
                          DecorationImage(fit: BoxFit.fill, image: userImage)),
                ),
                Gap(20),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: customeText(
                      text: requestText,
                      overflow: TextOverflow.ellipsis,
                      size: 14,
                      maxLines: 2),
                ),
                Gap(20),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: black,
                ),
              ],
            ),
            customeText(text: time.toString(), textcolor: grey600, size: 10)
          ],
        ),
      ),
    );
  }
}
