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
                    'https://www.woolha.com/media/2021/06/flutter-using-decorationimage-1200x627.jpg')
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
