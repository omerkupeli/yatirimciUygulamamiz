import 'package:flutter/material.dart';

Widget buildNavicon2(IconData iconData, bool active, BuildContext context,
     String imageName) {
  final imagePath = 'assets/images/$imageName';
  return GestureDetector(
    onTap: () {
      
    },
    child: PopupMenuButton<String>(
      constraints: BoxConstraints(
          maxHeight: 250, maxWidth: 200, minWidth: 200, minHeight: 250),
      offset: Offset(-145, -270),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
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
          for (var i = 0; i < 4; i++)
            PopupMenuItem<String>(
                value: 'menu1',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 110,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Panel $i",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          PopupMenuDivider(),
          PopupMenuItem<String>(
              value: 'menu2',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Eğitimlerim",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              )),
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
