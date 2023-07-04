import 'package:flutter/material.dart';

import '../widgets/navBarBottom.dart';

class PanelsPage extends StatefulWidget {
  @override
  _PanelsPageState createState() => _PanelsPageState();
}

class _PanelsPageState extends State<PanelsPage> {
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
                  Text("Panels"),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, PanelsPage()),
        ],
      )),
    );
  }
}
