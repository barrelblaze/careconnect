import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';

class EditProfileOrphanage extends StatefulWidget {
  OrphnRegModel orphnRegModel;
  BankDetailModel bankDetailModel;
  EditProfileOrphanage(
      {super.key, required this.bankDetailModel, required this.orphnRegModel});

  @override
  State<EditProfileOrphanage> createState() => _EditProfileOrphanageState();
}

class _EditProfileOrphanageState extends State<EditProfileOrphanage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController email =
        TextEditingController(text: widget.orphnRegModel.email);
    TextEditingController orphnName =
        TextEditingController(text: widget.orphnRegModel.orphnName);
    TextEditingController about =
        TextEditingController(text: widget.orphnRegModel.about);
    TextEditingController numberOfChild =
        TextEditingController(text: widget.orphnRegModel.childCount.toString());
    TextEditingController contactNumber = TextEditingController(
        text: widget.orphnRegModel.contactNumber.toString());

    TextEditingController location =
        TextEditingController(text: widget.orphnRegModel.location);
    TextEditingController bank =
        TextEditingController(text: widget.bankDetailModel.bank);
    TextEditingController accountNumber =
        TextEditingController(text: widget.bankDetailModel.accountNumber);
    TextEditingController epaymetNumber =
        TextEditingController(text: widget.bankDetailModel.epaymentnumber);
    TextEditingController bankContactNumber =
        TextEditingController(text: widget.bankDetailModel.accountNumber);

    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Edit Profile"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: hight * .18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: orphnName,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Black54)),
                        hintText: "Orphanage name",
                        hintStyle:
                            GoogleFonts.jua(color: grey600, fontSize: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeText(
                          text: "About",
                          size: 16,
                        ),
                        customeTextField(
                          hintText: "Type here..",
                          radius: 10,
                          controller: about,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: hight * .27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(5),
                    customeText(text: "More details", size: 16),
                    const Divider(),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Number of Children", size: 16),
                              customeText(text: "Contact no.", size: 16),
                              customeText(
                                  text: "Email",
                                  size: 16,
                                  textcolor: Colors.grey),
                              customeText(text: "Location", size: 16),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                context: context,
                                controller: numberOfChild,
                              ),
                              BlankTextField(
                                context: context,
                                controller: contactNumber,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: TextFormField(
                                  enabled: false,
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.jua(),
                                    enabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              BlankTextField(
                                  context: context, controller: location)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(13)),
                height: hight * .27,
                child: Column(
                  children: [
                    Gap(5),
                    customeText(text: "Bank details", size: 16),
                    const Divider(
                      color: Black54,
                    ),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Bank", size: 16),
                              customeText(text: "Account no.", size: 16),
                              customeText(text: "E-payment no.", size: 16),
                              customeText(text: "Contact no.", size: 16),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                  context: context, controller: bank),
                              BlankTextField(
                                  context: context, controller: accountNumber),
                              BlankTextField(
                                  context: context, controller: epaymetNumber),
                              BlankTextField(
                                  context: context,
                                  controller: bankContactNumber)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20),
              SizedBox(
                width: width * .45,
                height: hight * .05,
                child: ElevatedButton(
                  onPressed: () async {
                    int childcnt = int.parse(numberOfChild.text);
                    int phoneNumber = int.parse(contactNumber.text);
                    int bankNumber = int.parse(bankContactNumber.text);
                    await storeInstence.updateOrphanageDetails(
                        currentUserId,
                        OrphnRegModel(
                          
                            image: storeInstence.orphnRegModel?.image,
                            loginId: currentUserId,
                            orphnName: orphnName.text,
                            about: about.text,
                            childCount: childcnt,
                            contactNumber: phoneNumber,
                            email: email.text,
                            location: location.text),
                        BankDetailModel(
                            accountNumber: accountNumber.text,
                            bank: bank.text,
                            contactNumber: bankNumber,
                            epaymentnumber: epaymetNumber.text));
                    storeInstence.fetchCurrentOrganization(currentUserId);
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: customeText(text: "Save", textcolor: white, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
