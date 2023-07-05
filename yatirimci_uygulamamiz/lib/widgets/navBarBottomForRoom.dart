import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/ChatRoom.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/LiveShare.dart';
import 'package:yatirimci_uygulamamiz/screens/MyProfilePage.dart';
import 'package:yatirimci_uygulamamiz/screens/Panels.dart';
import 'package:yatirimci_uygulamamiz/screens/Searching.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavicon2.dart';
import '../screens/HomePage.dart';
import 'buildNavIcon.dart';

Widget buildBottomNavBarForRoom(BuildContext context, Widget currentPage) {
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
            buildNavIcon(Icons.post_add, currentPage is InPanelPostsPage,
                context, InPanelPostsPage()),
            buildNavIcon(Icons.live_tv_outlined, currentPage is LiveSharePage,
                context, LiveSharePage()),
            buildNavIcon(Icons.chat_rounded, currentPage is ChatRoomPage,
                context, ChatRoomPage()),
          ],
        ),
      ),
    ),
  );
}
