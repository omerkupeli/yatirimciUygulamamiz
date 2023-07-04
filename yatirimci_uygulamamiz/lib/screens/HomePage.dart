import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Yatırımcı Uygulamamız',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
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
                  post(context),
                  SizedBox(
                    height: 20,
                  ),
                  post(context),
                  SizedBox(
                    height: 20,
                  ),
                  post2(context),
                  SizedBox(
                    height: 20,
                  ),
                  post2(context),
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
