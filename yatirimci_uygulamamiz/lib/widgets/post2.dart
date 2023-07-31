import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/Models/User.dart';

import '../Models/Panel.dart';
import '../Models/Post.dart';

Widget post2(
    BuildContext context, double scale, Post post, User user, Panel panel) {
  var onPressed;
   void _showCommentDialog() {
  TextEditingController _commentController = TextEditingController();
 
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      
    ),
    builder: (BuildContext context) {
      return Container(
        
        
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yorumlar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("958 yorum"),
              ],
            ),
            Divider(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(child: Column(
                children: [
                  Row(children: [
                    Column(
                      children: [
                        ClipRRect(
                         
                          child: Image.network(
                            "http://192.168.56.1:8000/storage/posts/-1690794550.jpg",
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text("4g",style: TextStyle(fontSize: 10),)
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kullanıcı Adı",style: TextStyle(fontWeight: FontWeight.bold),),
                        Container(
  width: 265, 
  child: Text(
    "Kullanıcıların yaptıkları yorumlar burada yer alacak",
    softWrap: true, 
    overflow: TextOverflow.clip, 
  ),
),


                      ],
                    ),
                    Column(children: [
                      Row(children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                        Text("1",style: TextStyle(fontSize: 10),),
                      ],),
                      Text("Yanıtla",style: TextStyle(fontSize: 10),),
                      ],)
                    ],),
                    Text(" yanıtı görüntüle")
                ],
              )
                
               
              

              ),
            ),
            SizedBox(height: 120),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "http://192.168.56.1:8000/storage/posts/-1690794550.jpg",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Yorumunuzu buraya yazın',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      
                    ),
                    maxLines: 3,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(onPressed: () {
                    // Yorumu gönderme işlemleri burada yapılacak
                    String comment = _commentController.text;
                    // Yorumu gönderme işlemi burada yapılabilir

                    // Yorum yapma alanını kapatın
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.send)),
              ],
            ),
          ],
        ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  panel.image!.replaceAll("\\", "") ?? 'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
                                                  height: 80,
                                                  width: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(panel.name ?? ""),
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
                                        50), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          50), // Yarıçapı yarım resim boyutu kadar ayarlayın
                                      child: Image.network(
                                        "http://192.168.56.1:8000/storage/posts/-1690794550.jpg",
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
