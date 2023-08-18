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
          maxHeight: 95, maxWidth: 450, minWidth: 450, minHeight: 95),
      offset: Offset(-145, -110),
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
          width: 20,
          height: 20,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                panel.image!.replaceAll("\\", "") ?? 'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),

                            
                          ),
                          SizedBox(height: 5,),
                          Row(
      children: [
        Container(
            constraints: BoxConstraints(maxWidth: 55),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0)),
            child: Text(panel.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)) 
        ),
      ],
    ),
                        ],
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
