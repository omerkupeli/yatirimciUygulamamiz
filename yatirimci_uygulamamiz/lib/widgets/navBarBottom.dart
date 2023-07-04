import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/MyProfilePage.dart';
import 'package:yatirimci_uygulamamiz/screens/Panels.dart';
import 'package:yatirimci_uygulamamiz/screens/Searching.dart';
import '../screens/HomePage.dart';
import 'buildNavIcon.dart';

Widget buildBottomNavBar(BuildContext context, Widget currentPage) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(
                Icons.home, currentPage is HomePage, context, HomePage()),
            buildNavIcon(Icons.panorama_vertical_select,
                currentPage is PanelsPage, context, PanelsPage()),
            buildNavIcon(Icons.add_box_outlined, false, context, HomePage()),
            buildNavIcon(Icons.search, currentPage is SearchingPage, context,
                SearchingPage()),
            buildNavIcon(Icons.person, currentPage is MyProfilePage, context,
                MyProfilePage()),
          ],
        ),
      ),
    ),
  );
}
