import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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

class AddChildOrphanage extends StatefulWidget {
  AddChildOrphanage({super.key});

  @override
  State<AddChildOrphanage> createState() => _AddChildOrphanageState();
}

class _AddChildOrphanageState extends State<AddChildOrphanage> {
  TabController? tabcroller;
  FireStore fireStore = FireStore();
  TextEditingController name = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController age = TextEditingController();

  TextEditingController birthDay = TextEditingController();
  TextEditingController birthMonth = TextEditingController();
  TextEditingController birthYear = TextEditingController();

  TextEditingController joinday = TextEditingController();
  TextEditingController joinmonth = TextEditingController();
  TextEditingController joinYear = TextEditingController();

  TextEditingController location = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  ///////
  TextEditingController medicalStatus = TextEditingController();
  TextEditingController diseases = TextEditingController();
  TextEditingController disabilitiess = TextEditingController();
  TextEditingController childHight = TextEditingController();
  TextEditingController childWeight = TextEditingController();
  TextEditingController medicines = TextEditingController();

  String? selectedType;
  String? selectedStatus;
  String gender = "Female";

  bool isExpanded = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Add Child Details"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: appThemeGrey,
                      width: width * .28,
                      height: hight * .1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: const DecorationImage(image: userImage)),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: black,
                                ),
                                width: width * .28,
                                height: hight * .03,
                                child: Center(
                                  child: customeText(
                                      text: "Add Image", textcolor: white),
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
                        height: hight * .7,
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
                                customeText(
                                    text: "Ready For Adoption", size: 16),
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Child Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    context: context,
                                    hintText: "",
                                    controller: name),
                                BlankTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Nick Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    context: context,
                                    hintText: "",
                                    controller: nickname),
                                BlankTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Child Age";
                                      } else if (!value.isNumericOnly) {
                                        return "Enter correct Age";
                                      } else {
                                        return null;
                                      }
                                    },
                                    context: context,
                                    hintText: "",
                                    controller: age),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BlankTextField(
                                        // maxLength: 2,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Day";
                                          } else if (value.length < 2) {
                                            return "Invalid Input";
                                          } else {
                                            return null;
                                          }
                                        },
                                        fielSize: 40,
                                        context: context,
                                        hintText: "Day",
                                        controller: birthDay),
                                    customeText(text: "/", textcolor: grey600),
                                    BlankTextField(
                                        // maxLength: 2,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Month";
                                          } else if (value.length < 2) {
                                            return "Invalid Input";
                                          } else {
                                            return null;
                                          }
                                        },
                                        fielSize: 40,
                                        context: context,
                                        hintText: "Month",
                                        controller: birthMonth),
                                    customeText(text: "/", textcolor: grey600),
                                    BlankTextField(
                                        // maxLength: 4,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Year";
                                          } else if (value.length < 4) {
                                            return "Invalid Input";
                                          } else {
                                            return null;
                                          }
                                        },
                                        fielSize: 40,
                                        context: context,
                                        hintText: "Year",
                                        controller: birthYear),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BlankTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Day";
                                          } else if (value.length < 2) {
                                            return "Invalid Input";
                                          } else {
                                            return null;
                                          }
                                        },
                                        fielSize: 40,
                                        context: context,
                                        hintText: "Day",
                                        controller: joinday),
                                    customeText(text: "/", textcolor: grey600),
                                    BlankTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Month";
                                          } else if (value.length < 2) {
                                            return "Invalid Input";
                                          } else {
                                            return null;
                                          }
                                        },
                                        fielSize: 40,
                                        context: context,
                                        hintText: "Month",
                                        controller: joinmonth),
                                    customeText(text: "/", textcolor: grey600),
                                    BlankTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Year";
                                          } else if (value.length < 4) {
                                            return "Invalid Input";
                                          } else {
                                            return null;
                                          }
                                        },
                                        fielSize: 40,
                                        context: context,
                                        hintText: "Year",
                                        controller: joinYear),
                                  ],
                                ),
                                // BlankTextField(
                                // context: context, hintText: "day/dat/year"),
                                BlankTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the Location";
                                      } else {
                                        return null;
                                      }
                                    },
                                    context: context,
                                    hintText: "",
                                    controller: location),
                                BlankTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Blood Group ";
                                      } else {
                                        return null;
                                      }
                                    },
                                    context: context,
                                    hintText: "",
                                    controller: bloodGroup),
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
                    height: hight * .48,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Gap(10),
                          customeText(text: "Health Report", size: 17),
                          const Divider(
                            color: Black54,
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: 420,
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
                                      customeText(
                                          text: "Medical Status", size: 16),
                                      customeText(text: "Diseases", size: 16),
                                      customeText(
                                          text: "Disabilities", size: 16),
                                      customeText(text: "Hight", size: 16),
                                      customeText(text: "Weight", size: 16),
                                      customeText(text: "Medicines", size: 16),
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
                                      seperatorText,
                                      seperatorText,
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      BlankTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter Medical Status";
                                            } else {
                                              return null;
                                            }
                                          },
                                          context: context,
                                          hintText: "",
                                          controller: medicalStatus),
                                      BlankTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter diesease";
                                            } else {
                                              return null;
                                            }
                                          },
                                          context: context,
                                          hintText: "",
                                          controller: diseases),
                                      BlankTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter disabilitiess ";
                                            } else {
                                              return null;
                                            }
                                          },
                                          context: context,
                                          hintText: "",
                                          controller: disabilitiess),
                                      BlankTextField(
                                          validator: (value) {
                                            if (value!.isEmpty &&
                                                !value.isNumericOnly) {
                                              return "Enter Hight";
                                            } else {
                                              return null;
                                            }
                                          },
                                          context: context,
                                          hintText: "",
                                          controller: childHight),
                                      BlankTextField(
                                          validator: (value) {
                                            if (value!.isEmpty &&
                                                !value.isNumericOnly) {
                                              return "Enter Wight";
                                            } else {
                                              return null;
                                            }
                                          },
                                          context: context,
                                          hintText: "",
                                          controller: childWeight),
                                      BlankTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter Medicines";
                                            } else {
                                              return null;
                                            }
                                          },
                                          context: context,
                                          hintText: "",
                                          controller: medicines),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    width: width * .45,
                    height: hight * .05,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await addchild();
                          Get.to(ChildDetailsTabOrphanage());
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(black),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: customeText(
                          text: "Add Child", textcolor: white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String datePicker(String day, String month, String year) {
    String date = "${day}/${month}/${year}";
    print(date);
    return date;
  }

  addchild() async {
    int ager = int.parse(age.text);
    try {
      await fireStore.addChildToFirestore(
          ChildDataRegModel(
            orpId: FirebaseAuth.instance.currentUser!.uid,
              image: "",
              adoptionStatus: selectedStatus.toString(),
              age: ager,
              bloodGroup: bloodGroup.text,
              dirthdate:
                  datePicker(birthDay.text, birthMonth.text, birthYear.text),
              gender: gender,
              joinDate: datePicker(joinday.text, joinmonth.text, joinYear.text),
              location: location.text,
              name: name.text,
              nickNmae: nickname.text,
              orphanType: selectedType.toString()),
          ChildHealthReportModel(
              disabilities: disabilitiess.text,
              diseases: diseases.text,
              heght: childHight.text,
              medicalStatus: medicalStatus.text,
              medicines: medicines.text,
              weight: childWeight.text));
    } catch (e) {
      return Get.showSnackbar(GetSnackBar(
        message: "$e",
      ));
    }
  }
}
