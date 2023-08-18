import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/Models/Comment.dart';
import 'package:yatirimci_uygulamamiz/Models/Post.dart';
import 'package:yatirimci_uygulamamiz/Models/User.dart';
import 'package:yatirimci_uygulamamiz/widgets/post.dart';
import 'package:yatirimci_uygulamamiz/widgets/post2.dart';

import '../Models/Panel.dart';

Widget postProfile(BuildContext context, Post post, Panel panel, User user , List<Comment> comments, List<User> commentUsers){
  return GestureDetector(
    
    onLongPress: () {
      showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          content:
                                          ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      20),
                                            child: Image.network(
                                              post.image,
                                              height: 400,
                                              width: 450,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        
                                        );
                                      },
                                    );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(
                      post.image)
                  .image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.green,
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: onPressed,
                              icon: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 120,
                                            width: 120,
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      10), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                                  child: Image.network(
                                                    panel.image!.replaceAll("\\", "") ?? 'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
                                                    height: 80,
                                                    width: 80,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(panel.name ?? ""),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Tamam"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          50), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            50), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                        child: Image.network(
                                          panel.image!.replaceAll("\\", "") ?? 'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
                                          height: 30,
                                          width: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    ],
                  ),
        ),
      ),
    ),
  );
}
