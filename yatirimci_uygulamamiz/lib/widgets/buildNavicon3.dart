import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavIcon.dart';

Widget buildNavicon3(IconData iconData, bool active, BuildContext context,
    Widget page, String imageName) {
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
                  for (var i = 0; i < 4; i++)
                    PopupMenuItem<String>(
                      value: 'menu1',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://img.freepik.com/free-photo/digital-painting-mountain-with-colorful-tree-foreground_1340-25699.jpg',
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
