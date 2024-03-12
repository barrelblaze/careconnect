import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:orphanagemanagement/model/individual/indivi_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/notification_tab.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/profile_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/childdetails_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/profile_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/settings_tab.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPageIndividual extends StatefulWidget {
  int selectedIndex = 1;
  // IndivRegModel ?indivRegModel;
  MainPageIndividual({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<MainPageIndividual> createState() => _MainPageIndividualState();
}

class _MainPageIndividualState extends State<MainPageIndividual> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<FireStore>(context,listen: false)
    //     .fetchCurrentIndividualNow(firebaseAuth.currentUser!.uid);
   
    return Scaffold(
        body:
        
        
        
         Consumer<FireStore>(
           builder: (context,fires,chid) {
             return FutureBuilder(
              future:fires.fetchCurrentIndividualNow(FirebaseAuth.instance.currentUser!.uid) ,
               builder: (context,snapshot) {
                   if(snapshot.connectionState==ConnectionState.waiting){
                  return Center( child: CircularProgressIndicator(),);
                }
                 List<Widget> pages = [
      NotificationTabIndividual(),
   const    HomeTabIndividual(),
      ProfileTabIndividual(
        indivRegModel: fires.indivRegModel!,
        // indivRegModel:widget.indivRegModel!
      )
    ];
                 return pages[widget.selectedIndex];
               }
             );
           }
         ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: widget.selectedIndex,
          onTap: (index) {
            setState(() {
              widget.selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/chatG.png",
                ),
                icon: Image.asset(
                  "assets/chatIndivi.png",
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/homeG.png",
                ),
                icon: Image.asset(
                  "assets/homeIndivi (2).png",
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/userG.png",
                ),
                icon: Image.asset(
                  "assets/userIndivi.png",
                ),
                label: ""),
          ],
        ));
  }
}
