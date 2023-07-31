import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/post.dart';

Widget postProfile(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: Colors.black, width: 1),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
                    'http://192.168.56.1:8000/storage/posts/-1690794550.jpg')
                .image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.green,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.black,
                      size: 35,
                    ))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
