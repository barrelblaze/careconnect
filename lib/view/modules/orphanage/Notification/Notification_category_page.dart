import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/adoption%20requesst/adoption_request_notification_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Notification/donation/donation_notification_page.dart';
import 'package:orphanagemanagement/viewmodel/services_provider.dart';
import 'package:provider/provider.dart';

class NotificationCategoryPageOrphanage extends StatelessWidget {
  const NotificationCategoryPageOrphanage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ServiceProvider>(context, listen: false)
        .fetchAllAdoptionRequests(context);
    Provider.of<ServiceProvider>(context, listen: false)
        .fetchAllDoanationAccepetence(context, currentUserId);
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
            child: Column(children: [
              Gap(50),
              notificationBadge(
                content: "${service.donationAcceptenceList.length}",
                bgcolor: black,
                child: easyButton(
                  onpressed: () {
                    Get.to(DonationNotifiOrphanage());
                  },
                  bgColor: const MaterialStatePropertyAll(Colors.transparent),
                  context: context,
                  text: "Donations",
                  textcolor: grey600,
                  fontWeight: FontWeight.w400,
                  image: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: black,
                  ),
                ),
              ),
              Gap(25),
              notificationBadge(
                content: "${service.adoptionReqList.length}",
                bgcolor: black,
                child: easyButton(
                  onpressed: () {
                    Get.to(AdoptionRequestNotifiOrphanage());
                  },
                  bgColor: const MaterialStatePropertyAll(Colors.transparent),
                  context: context,
                  text: "Adoption request",
                  textcolor: grey600,
                  fontWeight: FontWeight.w400,
                  image: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: black,
                  ),
                ),
              )
            ]),
          );
        }));
  }

  Widget notificationBadge({child, bgcolor, Painting, content}) {
    return badges.Badge(
        position: badges.BadgePosition.topStart(top: -15, start: 5),
        badgeAnimation: const badges.BadgeAnimation.slide(
            // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
            // curve: Curves.easeInCubic,
            ),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(
          badgeColor: black,
        ),
        badgeContent: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        child: child);
  }
}
