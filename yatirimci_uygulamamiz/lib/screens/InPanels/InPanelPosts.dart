import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/post2.dart';

import '../../widgets/navBarBottomForRoom.dart';

class InPanelPostsPage extends StatefulWidget {
  const InPanelPostsPage({Key? key}) : super(key: key);

  @override
  _InPanelPostsPageState createState() => _InPanelPostsPageState();
}

class _InPanelPostsPageState extends State<InPanelPostsPage> {
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
            child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Gönderiler",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
              for (int i = 0; i < 10; i++)
                Column(
                  children: [
                    // post2(context, 1),
                    SizedBox(height: 14),
                  ],
                )
            ],
          ),
        )),
        buildBottomNavBarForRoom(context, InPanelPostsPage())
      ])),
    );
  }
}
