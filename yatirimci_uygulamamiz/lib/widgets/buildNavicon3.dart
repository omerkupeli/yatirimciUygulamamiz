import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/createPost.dart';

import '../Models/Panel.dart';

Widget buildNavicon3(IconData iconData, bool active, BuildContext context,
    Widget page, String imageName, List<Panel>? panels) {

  final imagePath = 'assets/images/$imageName';
 
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: PopupMenuButton<String>(
      constraints: BoxConstraints(
          maxHeight: 80, maxWidth: 450, minWidth: 450, minHeight: 80),
      offset: Offset(-145, -100),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.black, width: 2),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: active ? Colors.blue : Colors.white,
            width: 4,
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          imagePath,
          width: 25,
          height: 25,
        ),
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var panel in panels!)
                    PopupMenuItem<String>(
                      value: 'panel${panel.id}',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            panel.image!.replaceAll("\\", "") ?? 'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        
                      ),
                    ),
                ],
              ),
            ),
          ),
        ];
      },
      onSelected: (String value) {
        
        for (var panel in panels!) {
          if (value == 'panel${panel.id}') {
           Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePostScreen(panelId: panel.id,))  );
          }
        }
      },
    ),
  );
}
