import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/Models/User.dart';

import '../Models/Panel.dart';
import '../Models/Post.dart';

Widget post2(
    BuildContext context, double scale, Post post, User user, Panel panel) {
  var onPressed;
  return Transform.scale(
    scale: scale,
    child: Container(
      height: double.minPositive + 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.transparent,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 2),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  25), // Yarıçapı yarım resim boyutu kadar ayarlayın
                              child: Image.network(
                                user.image ?? "",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text(
                          user.name ?? "",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Text(
                    post.body ?? "",
                    style: TextStyle(fontSize: 16),
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: double.minPositive + 10),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      post.image,
                    ),
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
                                      title: Text("Bilgilendirme"),
                                      content: Text(panel.name.toString() +
                                          " adli panelde paylaşılan gönderi"),
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
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.black,
                                size: 35,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 2, 2),
                    child: IconButton(
                      onPressed: onPressed,
                      icon: Image.asset(
                        'assets/images/begeni.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                    child: IconButton(
                      onPressed: onPressed,
                      icon: Image.asset(
                        'assets/images/yorum.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.save_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'option1',
                    child: Text('Sesli Sohbet Odasına Davet Et'),
                  ),
                  PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('Gönderiyi Paylaş'),
                  ),
                  PopupMenuItem<String>(
                    value: 'option3',
                    child: Text('Gönderiyi Kopyala'),
                  ),
                ],
                onSelected: (String value) {
                  // Seçilen seçeneğe göre yapılacak işlemler
                  if (value == 'option1') {
                    // Seçenek 1 seçildiğinde yapılacak işlemler
                  } else if (value == 'option2') {
                    // Seçenek 2 seçildiğinde yapılacak işlemler
                  } else if (value == 'option3') {
                    // Seçenek 3 seçildiğinde yapılacak işlemler
                  }
                },
                icon: Icon(Icons.more_vert), // Dikey üç nokta ikonu
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
