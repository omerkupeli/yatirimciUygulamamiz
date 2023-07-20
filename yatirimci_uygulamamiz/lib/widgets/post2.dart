import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/Models/User.dart';

import '../Models/Panel.dart';
import '../Models/Post.dart';

Widget post2(
    BuildContext context, double scale, Post post, User user, Panel panel) {
  var onPressed;
  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _commentController = TextEditingController();

        return AlertDialog(
          title: Text('Yorum Yap'),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Yorumunuzu buraya yazın',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Burada yorumu gönderme işlemini gerçekleştirebilirsiniz
                String comment = _commentController.text;
                // Yorumu gönderme işlemi burada yapılabilir
              },
              child: Text('Gönder'),
            ),
          ],
        );
      },
    );
  }

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
                                        content: Container(
                                          height: 120,
                                          width: 120,
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                                child: Image.network(
                                                  "https://via.placeholder.com/640x480.png/003399?text=provident",
                                                  height: 80,
                                                  width: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Panel İsmi")
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
                                        10), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                      child: Image.network(
                                        "https://via.placeholder.com/640x480.png/003399?text=provident",
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
                      onPressed: _showCommentDialog,
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
