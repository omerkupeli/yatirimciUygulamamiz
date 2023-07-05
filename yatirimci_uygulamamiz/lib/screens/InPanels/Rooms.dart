import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';
import 'package:yatirimci_uygulamamiz/widgets/navBarBottomForRoom.dart';

import '../../widgets/buildNavIcon.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Yatırım Stratejileri",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Icon(Icons.search, size: 35)
          ],
        ),
      ),
      body: SafeArea(
          child: Stack(children: [
        SingleChildScrollView(
          child: Text("Yatırım Stratejileri"),
        ),
        buildBottomNavBarForRoom(context, InPanelPostsPage())
      ])),
    );
  }
}
