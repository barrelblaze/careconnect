
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';

class CreateCustomeNotificationPageOrphanage extends StatelessWidget {
  // int? passedIndex;
  CreateCustomeNotificationPageOrphanage({
    super.key,
    //  required this.passedIndex
  });
//   List<String> content = [
//     //fund
//     "This orphanage is in an immediate need of fund raising.\n \nplease consider a help.",

//     //foood
//     "This orphanage is in an immediate need for food supplies.\n \nplease consider a help.",
// //education
//     "This orphanage needs sponsors for the education of children.\n \nplease consider a help.",

// //cloaths
//     "This orphanage is in an immediate need for Clothes.\n \nplease consider a help.",
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(
          text: "Custome Notification",
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
                        // color: grey600,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          customeText(
                              text: "Orphanage Name",
                              size: 20,
                              textcolor: grey600),
                          Align(
                              alignment: Alignment.topLeft,
                              child: BlankTextField(
                                  fielSize: double.infinity,
                                  maxline: 4,
                                  context: context,
                                  hintText: "Type here.."))
                        ]),
                  ),
                  Gap(40),
                  customeText(
                      text: "Enter a name for this message",
                      textcolor: grey600),
                  Container(
                    // margin: const EdgeInsets.all(20),
                    height: 70,
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: grey600,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: BlankTextField(
                                  fielSize: double.infinity,
                                  maxline: 1,
                                  context: context,
                                  hintText: "Type here.."))
                        ]),
                  ),
                ],
              ),
              Gap(
                200,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                height: 60,
                child: easyButton(
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
