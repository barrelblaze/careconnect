import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/userprofile/editprofile/edit_profile_page.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class ProfileTabOrphanage extends StatefulWidget {
  OrphnRegModel orphnRegModel;
  BankDetailModel bankDetailModel;
  ProfileTabOrphanage(
      {super.key, required this.bankDetailModel, required this.orphnRegModel});

  @override
  State<ProfileTabOrphanage> createState() => _ProfileTabOrphanageState();
}

class _ProfileTabOrphanageState extends State<ProfileTabOrphanage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Profile"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
            customeText(text: "${widget.orphnRegModel.orphnName}", size: 22),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: width * .9,
                  height:
                      orientation == landScapeMode ? hight * .4 : hight * .25,
                  child:widget.orphnRegModel.image!.isEmpty? addImage:Image.network(widget.orphnRegModel.image!,fit: BoxFit.fill,),
                ),
              ),
              Gap(30),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: width * .3,
                  height:
                      orientation == landScapeMode ? hight * .07 : hight * .04,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>EditProfileOrphanage(bankDetailModel:widget.bankDetailModel,orphnRegModel: widget.orphnRegModel,));
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    child: customeText(
                        text: "Edit details", textcolor: black, size: 15),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: customeText(text: "About Us", size: 25)),
              Container(
                // alignment: Alignment.le,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: width,
                height: orientation == landScapeMode
                    ? hight * .25
                    : isExpanded
                        ? hight * .25
                        : hight * .1,
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "Details of orphanage like establishment date \n"
                      // " history contributions etc and more details for users.Details of "
                      // "orphanage like establishment date , history contributions etc and"
                      // " more details for users.Details of orphanage like establishment date "
                      // ", history contributions etc and more details for users",
                      "${widget.orphnRegModel.about}",
                      style: GoogleFonts.jua(fontSize: 13),
                      overflow: isExpanded
                          ? TextOverflow.clip
                          : TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: customeText(
                              text: isExpanded ? "read less" : "read more",
                              textcolor: grey600)),
                    )
                  ],
                ),
              ),
              Gap(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: orientation == landScapeMode ? hight * .6 : hight * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customeText(text: "More details", size: 17),
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
                              customeText(text: "Email", size: 16),
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
                              customeText(text: "${widget.orphnRegModel.childCount}", size: 16),
                              customeText(text: "${widget.orphnRegModel.contactNumber}", size: 16),
                              customeText(text:"${widget.orphnRegModel.email}", size: 16),
                              customeText(text: "${widget.orphnRegModel.location}", size: 16),
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
                height: orientation == landScapeMode ? hight * .6 : hight * .3,
                child: Column(
                  children: [
                    customeText(text: "Bank details", size: 17),
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
                             customeText(text: "${widget.bankDetailModel?.bank}", size: 16),
                              customeText(text: "${widget.bankDetailModel?.accountNumber}", size: 16),
                              customeText(text: "${widget.bankDetailModel?.epaymentnumber}", size: 16),
                              customeText(text:"${widget.bankDetailModel?.contactNumber}", size: 16),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
