import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/adoption%20requesst/adoptin_requested_user.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/donation/donated_user_data.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';
import 'package:provider/provider.dart';

class DonationNotifiOrphanage extends StatelessWidget {
  DonationNotifiOrphanage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      child:service.donationAcceptenceList.isEmpty?SizedBox(child: Center(child: customeText(text:"No donations", textcolor: grey600, size: 20),),) : ListView.separated(
                          itemBuilder: (context, index) => donationReplay(
                              ontap: () {
                                Get.to(DonatedUserProfileOrphanage(
                                    selectedUId: service
                                        .donationAcceptenceList[index].userid,
                                    userType: service
                                        .donationAcceptenceList[index]
                                        .userType));
                              },
                              userType: service
                                  .donationAcceptenceList[index].userType,
                              userTypeColor: service
                                          .donationAcceptenceList[index]
                                          .userType ==
                                      "Individual"
                                  ? green
                                  : blue,
                              userImage:service
                                      .donationAcceptenceList[index].image.isNotEmpty? NetworkImage(service
                                      .donationAcceptenceList[index].image) :
                                  imageNotFound,
                              requestText:
                                  service.donationAcceptenceList[index].data,
                              requestDateAndDay: service
                                  .donationAcceptenceList[index].dateAndDay,
                              requestTime:
                                  service.donationAcceptenceList[index].time),
                          separatorBuilder: (context, index) => Gap(30),
                          itemCount: service.donationAcceptenceList.length),
                    )
                  ]));
        }));
  }

  Widget donationReplay(
      {userType,
      userImage,
      String? requestText,
      requestDateAndDay,
      Color? userTypeColor,
      requestTime,
      Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 107,
        decoration: BoxDecoration(
            color: appThemeGrey, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customeText(text: userType, textcolor: userTypeColor),
                customeText(
                    textcolor: grey600, text: requestDateAndDay, size: 10),
              ],
            ),
            const Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(50),
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
            customeText(
                text: requestTime.toString(), textcolor: grey600, size: 10)
          ],
        ),
      ),
    );
  }
}
