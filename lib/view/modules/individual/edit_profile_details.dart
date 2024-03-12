import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/individual/indivi_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/home_tab.dart';
import 'package:orphanagemanagement/viewmodel/store_image.dart';

class EditProfileDetailIndividual extends StatelessWidget {
  String indiName;

  String contactNumber;
  String email;

  String location;
  EditProfileDetailIndividual(
      {super.key,
      required this.contactNumber,
      required this.email,
      required this.indiName,
      required this.location});

  @override
  Widget build(BuildContext context) {
    TextEditingController indiNamectr = TextEditingController(text: indiName);

    TextEditingController contactNumberctr =
        TextEditingController(text: contactNumber);

    TextEditingController locationctr = TextEditingController(text: location);
    TextEditingController emailctr = TextEditingController(text: email);
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        height: hight,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(70),
              customeText(
                  text: "Edit Profile", size: 25, fontWeight: FontWeight.w500),
              Gap(50),
              Column(
                children: [
                  TextFormField(
                    controller: indiNamectr,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: GoogleFonts.jua(color: black),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      hintStyle:
                          GoogleFonts.jua(color: appThemeGrey, fontSize: 20),
                    ),
                  ),
                  Gap(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeText(text: "Contact No", size: 16),
                      TextFormField(
                        controller: contactNumberctr,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                        ),
                      ),
                    ],
                  ),
                  Gap(50),
                  TextFormField(
                    controller: emailctr,
                    decoration: InputDecoration(
                      enabled: false,
                      labelText: "Email",
                      suffix: customeText(text: ".com", textcolor: grey600),
                      labelStyle: GoogleFonts.jua(color: black),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      hintStyle:
                          GoogleFonts.jua(color: appThemeGrey, fontSize: 20),
                    ),
                  ),
                  Gap(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeText(text: "Location", size: 16),
                      TextFormField(
                        controller: locationctr,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                        ),
                      ),
                    ],
                  ),
                  Gap(70),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: customeGradientButtom(
                      onpressed: () {
                        int number = int.parse(contactNumberctr.text);
                        storeInstence.updateIndividualDetails(
                            currentUserId,
                            IndivRegModel(loginId: currentUserId,
                                image: storeInstence.indivRegModel!.image,
                                name: indiNamectr.text,
                                contactNumber: number,
                                email: storeInstence.indivRegModel!.email,
                                location: locationctr.text));
                        Get.back();
                      },
                      context: context,
                      text: "Save",
                      textcolor: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
