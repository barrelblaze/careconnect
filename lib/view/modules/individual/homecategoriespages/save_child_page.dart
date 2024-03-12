// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:orphanagemanagement/utils/colors.dart';
// import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
// import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
// import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
// import 'package:orphanagemanagement/view/modules/individual/tabs/home_tab.dart';
// import 'package:orphanagemanagement/view/modules/individual/tabs/profile_tab.dart';

// class SaveChildPageIndividual extends StatefulWidget {
//   const SaveChildPageIndividual({super.key});

//   @override
//   State<SaveChildPageIndividual> createState() =>
//       _SaveChildPageIndividualState();
// }

// class _SaveChildPageIndividualState extends State<SaveChildPageIndividual> {
//   @override
//   Widget build(BuildContext context) {
//     final hight = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         // appBar: AppBar(),
//         body: Container(
//           margin: const EdgeInsets.all(20),
//           height: hight,
//           width: width,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Gap(70),
//                 customeText(
//                     text: "Save a child",
//                     size: 30,
//                     fontWeight: FontWeight.w500),
//                 Gap(50),
//                 Align(
//                   alignment: Alignment.center,
//                   child: customeText(
//                       text: "Add image of the child",
//                       size: 22,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Gap(20),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     height: hight * .2,
//                     width: width * .6,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: grey600!),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Image.asset("assets/addimage.png"),
//                   ),
//                 ),
//                 Gap(40),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     customeText(text: "More details", size: 18),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelStyle: GoogleFonts.jua(color: black),
//                         enabledBorder: const UnderlineInputBorder(
//                             borderSide: BorderSide(color: Black54)),
//                         focusedBorder: const UnderlineInputBorder(
//                             borderSide: BorderSide(color: Black54)),
//                         hintStyle:
//                             GoogleFonts.jua(color: appThemeGrey, fontSize: 20),
//                       ),
//                     ),
//                     Gap(50),
//                     customeText(text: "Location", size: 18),
//                     Gap(20),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             borderSide: BorderSide(color: Black54)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             borderSide: BorderSide(color: Black54)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(70),
//                 Align(
//                   alignment: Alignment.center,
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * .5,
//                     child: customeGradientButtom(
//                       onpressed: () {
//                         Get.to(MainPageIndividual(
//                           selectedIndex: 2,
//                         ));
//                       },
//                       context: context,
//                       text: "Next",
//                       textcolor: white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           elevation: 0,
//           onTap: (index) {
//             setState(() {
//               if (index == 0) {
//                 Get.to(MainPageIndividual(selectedIndex: 0));
//               } else if (index == 1) {
//                 Get.to(MainPageIndividual(selectedIndex: 1));
//               } else {
//                 Get.to(MainPageIndividual(selectedIndex: 2));
//               }
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//                 // activeIcon: Image.asset(
//                 //   "assets/chatG.png",
//                 // ),
//                 icon: Image.asset(
//                   "assets/chatIndivi.png",
//                 ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 // activeIcon: Image.asset(
//                 //   "assets/homeG.png",
//                 // ),
//                 icon: Image.asset(
//                   "assets/homeIndivi (2).png",
//                 ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 // activeIcon: Image.asset(
//                 //   "assets/userG.png",
//                 // ),
//                 icon: Image.asset(
//                   "assets/userIndivi.png",
//                 ),
//                 label: ""),
//           ],
//         ));
//   }
// }
