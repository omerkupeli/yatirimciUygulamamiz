import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            PopupMenuButton(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    )),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('Normal Oda Oluştur'),
                    ),
                    PopupMenuItem(
                      child: Text('Müzik Odası Oluştur'),
                    ),
                    PopupMenuItem(
                      child: Text('Şifreli Oda Oluştur'),
                    ),
                  ];
                }),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 10; i++)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://img.freepik.com/free-photo/digital-painting-mountain-with-colorful-tree-foreground_1340-25699.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
