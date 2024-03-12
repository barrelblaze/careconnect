import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orphanagemanagement/model/other_models/help_request_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';

class SendRequestToUserOrphanage extends StatelessWidget {
  int? passedIndex;
  SendRequestToUserOrphanage({super.key, required this.passedIndex});
  List<String> content = [
    //fund
    "This orphanage is in an immediate need of fund raising.\n \nplease consider a help.",

    //foood
    "This orphanage is in an immediate need for food supplies.\n \nplease consider a help.",
//education
    "This orphanage needs sponsors for the education of children.\n \nplease consider a help.",

//cloaths
    "This orphanage is in an immediate need for Clothes.\n \nplease consider a help.",
  ];
  List<String> requestType = ["FUND", "FOOD", "EDUCATION", "CLOATHS"];
  String time = DateFormat('h:mm a').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(
          text: "Send Notification",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(100),
                  customeText(
                      text: "Notification will displayed as follows",
                      textcolor: grey600),
                  Container(
                    // margin: const EdgeInsets.all(20),
                    height: 200,
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          customeText(
                              text: "Orphanage Name",
                              size: 20,
                              textcolor: grey600),
                          Gap(15),
                          customeText(text: content[passedIndex!], size: 17)
                        ]),
                  ),
                ],
              ),
              const Gap(100),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                height: 60,
                child: easyButton(
                    onpressed: () {
                      serviceProviderinstence.sendNewNotificationToUsers(
                          HelpRequestModel(
                            dataAndDay: "$date $day",
                            time: time,
                            image: storeInstence.orphnRegModel!.image!,
name: storeInstence.orphnRegModel!.orphnName,
                              data: content[passedIndex!],
                              orphanId: currentUserId,
                              reqStatus: "Requested",
                              reqType: requestType[passedIndex!]),context);
                      Get.back();
                    },
                    context: context,
                    bgColor: const MaterialStatePropertyAll(black),
                    text: "Send",
                    fontWeight: FontWeight.w400,
                    textcolor: white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
