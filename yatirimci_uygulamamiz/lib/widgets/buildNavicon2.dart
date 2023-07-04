import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavIcon.dart';

Widget buildNavicon2(
    IconData iconData, bool active, BuildContext context, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: PopupMenuButton<String>(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: active ? Colors.blue : Color.fromARGB(166, 201, 201, 201),
        ),
        padding: const EdgeInsets.all(8),
        child: ImageIcon(
          NetworkImage("https://cdn-icons-png.flaticon.com/512/64/64572.png"),
          size: 25,
          color: Colors.white,
        ),
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
              value: 'menu1',
              child: buildNavIcon(Icons.room, active, context, page)),
          PopupMenuItem<String>(
              value: 'menu2',
              child: buildNavIcon(Icons.room, active, context, page)),
          PopupMenuItem<String>(
              value: 'menu3',
              child: buildNavIcon(Icons.room, active, context, page)),
          PopupMenuItem<String>(
              value: 'menu3',
              child: buildNavIcon(Icons.room, active, context, page)),
          PopupMenuItem<String>(
              value: 'menu3',
              child: buildNavIcon(Icons.room, active, context, page)),
          PopupMenuItem<String>(
              value: 'menu3',
              child: buildNavIcon(Icons.room, active, context, page)),
        ];
      },
      onSelected: (String value) {
        // Seçilen butonun değerine göre işlemler yapabilirsiniz
        if (value == 'menu1') {
          // Menü 1'e tıklanıldığında yapılacak işlemler
        } else if (value == 'menu2') {
          // Menü 2'ye tıklanıldığında yapılacak işlemler
        } else if (value == 'menu3') {
          // Menü 3'e tıklanıldığında yapılacak işlemler
        }
      },
    ),
  );
}
