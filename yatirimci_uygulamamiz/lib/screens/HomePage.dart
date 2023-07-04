import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/MyProfilePage.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavIcon.dart';
import 'package:yatirimci_uygulamamiz/widgets/navBarBottom.dart';
import 'package:yatirimci_uygulamamiz/widgets/post.dart';

import '../widgets/post2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get onPressed => null;
  //push profilepage
  void onPressed2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[800],
              ),
              child: IconButton(
                onPressed: onPressed2,
                icon: Icon(Icons.person),
                color: Colors.white,
                iconSize: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Yatırımcı Uygulamamız',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Keşfet",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  post(
                    context,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  post(
                    context,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  post2(context, 1),
                  SizedBox(
                    height: 20,
                  ),
                  post2(context, 1),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, HomePage()),
        ],
      )),
    );
  }
}
