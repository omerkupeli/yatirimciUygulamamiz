import 'package:flutter/material.dart%20';
import 'package:yatirimci_uygulamamiz/widgets/panelsInPanelList.dart';

import '../widgets/navBarBottom.dart';

class PanelsPage extends StatefulWidget {
  @override
  _PanelsPageState createState() => _PanelsPageState();
}

class _PanelsPageState extends State<PanelsPage> {
  List<bool> isExpandedList = List.generate(
      10,
      (index) =>
          false); // Her bir elementin genişletilip genişletilmediğini tutan liste
  List<TextButton> subtitles = [
    TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "Yatırım Stratejileri",
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
    TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Temel Analizler",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
    TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Teknik Analizler",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panels"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    for (int i = 0; i < 4; i++)
                      panelInPanelList(context, setState, isExpandedList, i,
                          "Onur Beyin Odası $i", subtitles)
                  ],
                ),
              ),
            ),
            buildBottomNavBar(context, PanelsPage()),
          ],
        ),
      ),
    );
  }
}
