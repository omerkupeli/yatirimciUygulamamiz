import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/Auth/loginPage.dart';
import 'package:yatirimci_uygulamamiz/screens/Auth/registerPage.dart';
import 'package:yatirimci_uygulamamiz/screens/HomePage.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/ChatRoom.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/LiveShare.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/Rooms.dart';
import 'package:yatirimci_uygulamamiz/screens/MyProfilePage.dart';
import 'package:yatirimci_uygulamamiz/screens/Panels.dart';
import 'package:yatirimci_uygulamamiz/screens/createPost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyProfilePage(profileUserId: 1),
    );
  }
}
