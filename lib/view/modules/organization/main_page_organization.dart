import 'package:flutter/material.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/utils/variables.dart';

import 'package:orphanagemanagement/view/modules/organization/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/organization/tabs/notification_tab.dart';
import 'package:orphanagemanagement/view/modules/organization/tabs/profile_tab.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';

class MainPageOrganization extends StatefulWidget {
  int selectedIndex = 1;

  MainPageOrganization({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<MainPageOrganization> createState() => _MainPageOrganizationState();
}

class _MainPageOrganizationState extends State<MainPageOrganization> {
  @override
  Widget build(BuildContext context) {
    Provider.of<FireStore>(context, listen: false)
        .fetchOrganizationnow(firebaseAuth.currentUser!.uid);
    List<Widget> pages = [
      NotificationTabOrganization(),
      const HomeTabOrganization(),
      ProfileTabOrganization()
    ];

    return Scaffold(
        body: pages[widget.selectedIndex],
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
