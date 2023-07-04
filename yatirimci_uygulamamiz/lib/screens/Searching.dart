import 'package:flutter/material.dart';

import '../widgets/navBarBottom.dart';

class SearchingPage extends StatefulWidget {
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searching Page"),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Searching Page"),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, SearchingPage()),
        ],
      )),
    );
  }
}
