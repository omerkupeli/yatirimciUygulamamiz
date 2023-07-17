import 'package:flutter/material.dart';

Widget buildNavIcon(
  String imageName, // Resim dosyasının adını alır
  bool active,
  BuildContext context,
  Widget page,
) {
  final imagePath = 'assets/images/$imageName';

  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
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
        width: 30,
        height: 30,
      ),
    ),
  );
}
