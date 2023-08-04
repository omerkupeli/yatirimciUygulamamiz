import 'package:flutter/material.dart';

Widget buildNavIcon4(
  
  bool active,
  BuildContext context,
  Widget page,
) {
 

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
      child: Icon(
        Icons.menu_book_sharp,
        color: Colors.black,
        size: 25,)
    ),
  );
}
