import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/MyProfilePage.dart';
import 'package:yatirimci_uygulamamiz/screens/Panels.dart';
import 'package:yatirimci_uygulamamiz/screens/Searching.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavicon2.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavicon3.dart';
import '../Models/Panel.dart';
import '../screens/HomePage.dart';
import 'buildNavIcon.dart';

Widget buildBottomNavBar(BuildContext context, Widget currentPage , List<Panel>? panels) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      
      decoration:const BoxDecoration(
        color: Colors.white, 
        border: Border.symmetric(
          horizontal:BorderSide(
            color: Colors.grey,
            width: 2  )
        )          
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(
              'Anasayfa.png', currentPage is HomePage, context, HomePage()),
          buildNavIcon(
              'panel.png', currentPage is PanelsPage, context, PanelsPage()),
          buildNavicon3(Icons.add, false, context, HomePage(), 'paylas.png' , panels ),
          buildNavIcon('yorum.png', currentPage is SearchingPage, context,
              SearchingPage()),
          buildNavicon2(
              Icons.person, false, context, 'hesap.png'),
        ],
      ),
    ),
  );
}
