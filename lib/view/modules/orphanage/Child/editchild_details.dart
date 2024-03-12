import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orphanagemanagement/model/other_models/child_detail_model.dart';
import 'package:orphanagemanagement/model/other_models/child_helath_report.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/childdetails_tab.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/store_image.dart';
import 'package:provider/provider.dart';

class EditChildDetailPageOrphanage extends StatefulWidget {
  dynamic childID;
  ChildDataRegModel childDataRegModel;
  ChildHealthReportModel childHealthReportModel;
  EditChildDetailPageOrphanage(
      {super.key,
      required this.childID,
      required this.childDataRegModel,
      required this.childHealthReportModel});

  @override
  State<EditChildDetailPageOrphanage> createState() =>
      _EditChildDetailPageOrphanageState();
}

class _EditChildDetailPageOrphanageState
    extends State<EditChildDetailPageOrphanage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController name =
        TextEditingController(text: widget.childDataRegModel.name);
    TextEditingController nickname =
        TextEditingController(text: widget.childDataRegModel.nickNmae);
    TextEditingController age =
        TextEditingController(text: widget.childDataRegModel.age.toString());

    TextEditingController location =
        TextEditingController(text: widget.childDataRegModel.location);
    TextEditingController bloodGroup =
        TextEditingController(text: widget.childDataRegModel.bloodGroup);
    ///////
    TextEditingController medicalStatus = TextEditingController(
        text: widget.childHealthReportModel.medicalStatus);
    TextEditingController diseases =
        TextEditingController(text: widget.childHealthReportModel.diseases);
    TextEditingController disabilitiess =
        TextEditingController(text: widget.childHealthReportModel.disabilities);
    TextEditingController childHight =
        TextEditingController(text: widget.childHealthReportModel.heght);
    TextEditingController childWeight =
        TextEditingController(text: widget.childHealthReportModel.weight);
    TextEditingController medicines =
        TextEditingController(text: widget.childHealthReportModel.medicines);
    String gender = widget.childDataRegModel.gender;
    String selectedType = widget.childDataRegModel.orphanType;
    String selectedStatus = widget.childDataRegModel.adoptionStatus;
    print(widget.childID);
    final firestore = Provider.of<FireStore>(context);
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Edit Child Details"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: appThemeGrey,
                    width: orientation == landScapeMode
                        ? width * .20
                        : width * .28,
                    height:
                        orientation == landScapeMode ? hight * .25 : hight * .1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          // height: 70,
                          // width: 70,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(
                                        "${firestore.childDataRegModel!.image}",
                                      ) ??
                                      imageNotFound)),
                        ),
                        InkWell(
                          onTap: () async {
                            await selectImage(context).then((value) =>
                                firestore.uploadChilimageToFirestore(
                                    widget.childID, imageFile!));
                          },
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: black,
                              ),
                              width: width * .28,
                              height: orientation == landScapeMode
                                  ? hight * .05
                                  : hight * .03,
                              child: Center(
                                child: customeText(
                                    text: "Remove/Change", textcolor: white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 480,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Name", size: 16),
                              customeText(text: "Nick Name.", size: 16),
                              customeText(text: "Age", size: 16),
                              customeText(text: "Gender", size: 16),
                              customeText(text: "Birth Date", size: 16),
                              customeText(text: "Joined Date", size: 16),
                              customeText(text: "Known location", size: 16),
                              customeText(text: "Bkood Group", size: 16),
                              customeText(text: "Orphan Type", size: 16),
                              customeText(text: "Ready For Adoption", size: 16),
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
                              seperatorText,
                              seperatorText,
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
                                  controller: name,
                                  context: context,
                                  hintText: "sample anme"),
                              BlankTextField(
                                  context: context,
                                  hintText: "Sample Nick Name",
                                  controller: nickname),
                              BlankTextField(
                                  context: context,
                                  hintText: "5 Years",
                                  controller: age),
                              // BlankTextField(
                              //   context: context,
                              //   hintText: "Malelllllllllllllll",
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(50)),
                                // color: grey600,
                                height: 30,
                                // width: 100,
                                child: TabBar(
                                    onTap: (index) {
                                      if (index == 0) {
                                        gender = "Female";
                                      } else {
                                        gender = "Male";
                                      }
                                    },
                                    // indicatorWeight: 0,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    isScrollable: true,
                                    labelColor: white,
                                    labelPadding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10), // Creates border
                                        color: black),
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      customeText(text: "Feamle"),
                                      customeText(text: "Male")
                                    ]),
                              ),
                              BlankTextField(
                                  context: context,
                                  hintText: "22/12/2017//////////////////",
                                  controller: name),
                              BlankTextField(
                                  context: context,
                                  hintText: "02/08/2020////////////////",
                                  controller: name),
                              BlankTextField(
                                  context: context,
                                  hintText: "Malappuram",
                                  controller: location),
                              BlankTextField(
                                  context: context,
                                  hintText: "O +ve",
                                  controller: bloodGroup),
                              // BlankTextField(
                              //     context: context,
                              //     hintText: "Double orphan//////////////",
                              //     controller: name),
                              // BlankTextField(
                              //     context: context,
                              //     hintText: "Ready for adopt//////////////",
                              //     controller: name),
                              DropdownButton<String>(
                                // style: GoogleFonts.jua(),
                                value: selectedType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Maternal',
                                  'Patern',
                                  'Duble',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: customeText(
                                          text: value, textcolor: grey600));
                                }).toList(),
                              ),
                              DropdownButton<String>(
                                // style: GoogleFonts.jua(),
                                value: selectedStatus,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedStatus = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Ready',
                                  "Can't adapt",
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: customeText(
                                          text: value, textcolor: grey600));
                                }).toList(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: appThemeGrey,
                      borderRadius: BorderRadius.circular(13)),
                  height:
                      orientation == landScapeMode ? hight * .8 : hight * .36,
                  child: Column(
                    children: [
                      customeText(text: "Health Report", size: 17),
                      const Divider(
                        color: Black54,
                      ),
                      SizedBox(
                        height: 290,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customeText(text: "Medical Status", size: 16),
                                customeText(text: "Diseases", size: 16),
                                customeText(text: "Disabilities", size: 16),
                                customeText(text: "Hight", size: 16),
                                customeText(text: "Weight", size: 16),
                                customeText(text: "Medicines", size: 16),
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
                                seperatorText,
                                seperatorText,
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BlankTextField(
                                    controller: medicalStatus,
                                    context: context,
                                    hintText: "Good"),
                                BlankTextField(
                                  context: context,
                                  hintText: "None",
                                  controller: diseases,
                                ),
                                BlankTextField(
                                  context: context,
                                  hintText: "None",
                                  controller: disabilitiess,
                                ),
                                BlankTextField(
                                  context: context,
                                  hintText: "108.2",
                                  controller: childHight,
                                ),
                                BlankTextField(
                                  context: context,
                                  hintText: "18 kg",
                                  controller: childWeight,
                                ),
                                BlankTextField(
                                  context: context,
                                  hintText: "None",
                                  controller: medicines,
                                ),
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
                  height:
                      orientation == landScapeMode ? hight * .08 : hight * .05,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ChildDetailsTabOrphanage());
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child:
                        customeText(text: "Save", textcolor: white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
