import 'package:flutter/material.dart';

Widget post2(BuildContext context, double scale) {
  return Transform.scale(
    scale: scale,
    child: Container(
      height: double.minPositive + 480,
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
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 2),
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/64/64572.png',
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Text("Kullanıcı Adı", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
              Container(
                  child: Text(
                'Bu bir örnek metindir. Bu metin birden fazla satıra sahip olabilir. Gönderinin tamamını görmek için gönderiye tıklayın....',
                style: TextStyle(fontSize: 16),
                maxLines: 5, // Maksimum 2 satır göster
                overflow:
                    TextOverflow.ellipsis, // Taşan metni kırp ve ... ile göster
              ))
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 2),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.heart_broken,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.comment_sharp,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.save,
                        color: Colors.black,
                      )),
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
              )
            ],
          )
        ],
      ),
    ),
  );
}

void onPressed() {}
