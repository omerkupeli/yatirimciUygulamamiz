import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/ChatRoom.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/LiveShare.dart';
import 'buildNavIcon.dart';

Widget buildBottomNavBarForRoom(BuildContext context, Widget currentPage) {
  return Align(
    alignment: Alignment.topCenter,
    child: ClipRRect(
      // borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon('panel.png', currentPage is InPanelPostsPage, context,
                InPanelPostsPage()),
            buildNavIcon('canli_yayin.png', currentPage is LiveSharePage,
                context, LiveSharePage()),
            buildNavIcon('mesaj_balonu.png', currentPage is ChatRoomPage,
                context, ChatRoomPage()),
          ],
        ),
      ),
    ),
  );
}
