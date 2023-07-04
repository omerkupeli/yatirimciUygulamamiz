import 'package:flutter/material.dart';

import '../widgets/navBarBottom.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyProfile Page"),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("MyProfile Page"),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, MyProfilePage()),
        ],
      )),
    );
  }
}
