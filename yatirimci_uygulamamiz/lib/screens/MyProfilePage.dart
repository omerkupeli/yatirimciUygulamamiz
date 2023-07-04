import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/post.dart';
import 'package:yatirimci_uygulamamiz/widgets/post2.dart';

import '../widgets/navBarBottom.dart';
import '../widgets/postProfile.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  get onPressed2 => null;
  bool isLocked = true;

  void onLockClicked() {
    setState(() {
      isLocked = !isLocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Yatırımcı Uygulamamız',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text("Profili Düzenle"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.panorama_vertical_select),
                        SizedBox(width: 10),
                        Text("Panel Gönderileri"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Text("Ayarlar ve Gizlilik"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option4',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(width: 10),
                        Text("Dil Seçenekleri"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option5',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.dark_mode),
                        SizedBox(width: 10),
                        Text("Karanlık Mod"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option6',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.qr_code_2),
                        SizedBox(width: 10),
                        Text("QR Kodu"),
                      ],
                    ),
                  ),
                ),
              ],
              onSelected: (String value) {
                // Seçilen seçeneğe göre yapılacak işlemler
                if (value == 'option1') {
                  //popup
                }

                if (value == 'option2') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Panel Gönderileri"),
                          content: Row(
                            children: [
                              Text(
                                "Panel Gönderilerindeki Yorumları Kapat",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: Text("Kapat"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }

                if (value == 'option3') {}

                if (value == 'option4') {}

                if (value == 'option5') {}

                if (value == 'option6') {}
              },
              icon: Icon(
                Icons.more_vert,
                size: 35,
              ), // Dikey üç nokta ikonu
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.grey,
                                width: 5,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 70,
                                width: 70,
                                child: Image.network(
                                  'https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: onLockClicked,
                            icon: Icon(isLocked
                                ? Icons.lock_outline_rounded
                                : Icons.lock_open_rounded),
                            iconSize: 30,
                            color: Colors.grey[800],
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Panellerim",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("12")
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Taklipçi",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("12")
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Takip",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("12")
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Kullanıcı Adı",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text("İsim Soyisim"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Panel Gönderilerim",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Biyografim",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Column(
                          children: List.generate(
                            10,
                            (index) {
                              return index % 2 == 0
                                  ? Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 6, 3, 6),
                                          child: postProfile(context),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 6, 3, 6),
                                          child: postProfile(context),
                                        ),
                                      ],
                                    )
                                  : SizedBox(width: 6);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, MyProfilePage()),
        ],
      )),
    );
  }
}
