import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/ChatRoom.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/LiveShare.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/Rooms.dart';
import 'buildNavIcon.dart';
import 'buildNavIcon4.dart';

Widget buildBottomNavBarForRoom(BuildContext context, Widget currentPage) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      
      decoration:const BoxDecoration(
        color: Colors.white, 
        border: Border.symmetric(
          horizontal:BorderSide(
            color: Colors.grey,
            width: 1  )
        )          
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon('panel.png', currentPage is RoomsPage, context,
                RoomsPage()),
            buildNavIcon('canli_yayin.png', currentPage is LiveSharePage,
                context, LiveSharePage()),
            buildNavIcon4( currentPage is ChatRoomPage,
                context, ChatRoomPage()),
          ],
        ),
      ),
    
  );
}
