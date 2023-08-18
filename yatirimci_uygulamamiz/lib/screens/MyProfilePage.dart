import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/Models/Comment.dart';
import 'package:yatirimci_uygulamamiz/Models/Panel.dart';
import 'package:yatirimci_uygulamamiz/Models/Post.dart';
import 'package:yatirimci_uygulamamiz/Models/User.dart';
import 'package:yatirimci_uygulamamiz/screens/Settings/MyAccount.dart';
import 'package:yatirimci_uygulamamiz/screens/Settings/panelSettings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../widgets/navBarBottom.dart';
import '../widgets/postProfile.dart';

class MyProfilePage extends StatefulWidget {
  final int profileUserId;
   MyProfilePage({Key? key, required this.profileUserId}) : super(key: key);
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
  List<Post> posts = [];
   List<Panel> _followedPanels = [];
   List<Comment> _comments = [];
   List<Panel> _panels = [];
   List<User> _users = [];
    
 
  User user = User(id: 1, name: "name", email: "email", username: "username", password: "password", image: "http://192.168.56.1:8000/storage/posts/-1690794550.jpg");

  String ipAddress = "http://192.168.56.1:8000/api/";
  Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 24|xF4KzO9dIlUBW5wOnv2sHVF9KlKjonoueYQ8hSUe',
};


 Future<void> fetchFollowedPanels() async {
    try {
      final response = await http.get(Uri.parse('$ipAddress''user/followed-panels'), headers: headers);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final followedRooms = responseData['followed_rooms'] as List<dynamic>;

        _followedPanels = followedRooms
            .map((data) => Panel.fromJson(data))
            .toList();
        print(_followedPanels.length);
      } else {
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'];
        print('Error: $errorMessage');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

   Future<void> fetchComments(int postId) async {
  try {
    final response = await http.get(Uri.parse('$ipAddress''post/$postId/comments'), headers: headers);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final comments = responseData['comments'] as List<dynamic>;

      _comments = comments
          .map((data) => Comment.fromJson(data))
          .toList();
          print(_comments[0].comment);
      
    } else {
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      print('Error: $errorMessage');
    }
  } catch (e) {
    print('Error: $e');
  }
}

   Future<void> isPostLiked(int postId) async {
    try {
      final response = await http.get(Uri.parse('$ipAddress''post/$postId/isLiked'), headers: headers);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final isLiked = responseData['liked'] as bool;
        print(isLiked);
      } else {
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'];
        print('Error: $errorMessage');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$ipAddress' 'postsByUserId'),
    headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);

      setState(() {
        posts = responseData
            .map((data) => Post.fromJson(data))
            .toList()
            .cast<Post>();
            print(posts.length  ) ;
             for (var post in posts) {
          getUserById(post.user_id);
          getPanelById(post.panel_id);
          fetchComments(post.id);
        }
      });
    } else {
      throw Exception('API isteği başarısız: ${response.statusCode}');
    }
  }

   Future<void> getPanelById(int panelId) async {
    final response =
        await http.get(Uri.parse('$ipAddress' 'panelsById/$panelId'),
        headers: headers,);

    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);

      if (responseData is List) {
        for (var data in responseData) {
          if (data is Map<String, dynamic>) {
            setState(() {
              var panel = Panel.fromJson(data);
              _panels.add(panel);
            });
          }
        }
        print(_panels.length);
      } else if (responseData is Map<String, dynamic>) {
        setState(() {
          var panel = Panel.fromJson(responseData);
          _panels.add(panel);
          print(_panels.length);
        });
      }
    } else {
    throw Exception('API isteği başarısız: ${response.statusCode}');
    }
  }

  Future<void> getUserById(int userId) async {
    final response = await http.get(Uri.parse('$ipAddress' 'userById/$userId'),
    headers: headers,);

    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);

      if (responseData is List) {
        for (var data in responseData) {
          if (data is Map<String, dynamic>) {
            setState(() {
              var user = User.fromJson(data);
              _users.add(user);
            });
          }
        }
        print(_users.length);
      } else if (responseData is Map<String, dynamic>) {
        setState(() {
          var user = User.fromJson(responseData);
          _users.add(user);
          print(_users.length);
        });
      }
    } else {
      throw Exception('API isteği başarısız: ${response.statusCode}');
    }
  }

  Future<void> getUser() async {
    final response = await http.get(Uri.parse('$ipAddress' 'user'),
    headers: headers,);

    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);

      
        
        setState(() {
          var user1 = User.fromJson(responseData);
          user = user1;
        });

      }
     else {
      throw Exception('API isteği başarısız: ${response.statusCode}');
    }
  }


  @override
  void initState() {
    super.initState();
    fetchPosts();
    fetchFollowedPanels();
    getUser();
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
                        ImageIcon(AssetImage('assets/images/hesap.png')),
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
                        ImageIcon(AssetImage('assets/images/panel_2.png')),
                        SizedBox(width: 10),
                        Text("Panel Gönderileri"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Column(
                    children: [
                      PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'suboption1',
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                Text('Hesabım'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'suboption2',
                            child: Row(
                              children: [
                                Icon(Icons.security),
                                Text('Gizlilik'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'suboption3',
                            child: Row(
                              children: [
                                Icon(Icons.attach_money_outlined),
                                Text('Bakiye Cüzdanım'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'suboption4',
                            child: Row(
                              children: [
                                Icon(Icons.notifications_active),
                                Text('Bildirimler'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'suboption5',
                            child: Row(
                              children: [
                                Icon(Icons.help_center),
                                Text('Yardım Merkezi'),
                              ],
                            ),
                          ),
                        ],
                        color: Colors.grey[100],
                        child: Row(
                          children: [
                            SizedBox(width: 16),
                            ImageIcon(AssetImage('assets/images/ayarlarr.png')),
                            SizedBox(width: 10),
                            Text("Ayarlar ve Gizlilik"),
                          ],
                        ),
                        onSelected: (value) {
                          if (value == 'suboption1') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAccount()),
                            );
                          }
                          if (value == 'suboption2') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PanelSettings()),
                            );
                          }
                          if (value == 'suboption3') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PanelSettings()),
                            );
                          }
                          if (value == 'suboption4') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PanelSettings()),
                            );
                          }
                          if (value == 'suboption5') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PanelSettings()),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option4',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        ImageIcon(
                            AssetImage('assets/images/dil_secenegi_2.png')),
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
                        ImageIcon(AssetImage('assets/images/gece_gorunum.png')),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PanelSettings(),
                    ),
                  );
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
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,) ,
                        IconButton(
                          onPressed: onLockClicked,
                          icon: ImageIcon(
                              AssetImage('assets/images/gizlilik.png')),
                          iconSize: 30,
                          color: Colors.grey[800],
                        ),
                        
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
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'http://192.168.56.1:8000/storage/posts/-1690794550.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                        child: Column(
                          children: [
                            if (user.username != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.username!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                              height: 6,
                            ),
                            Text(user.name),
                              ],
                            ),
                            if (user.username == null)
                            Text(user.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 5, 4, 5),
                                  child: Text(
                                    "Hakkımda",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                  
                  
                          
                        ],
                          ),
                        ),
                       
                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Eğitimler",
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
                              "Öğrenciler",
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         border: Border.all(color: Colors.black, width: 1),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(4.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(14),
                  //             border: Border.all(color: Colors.black, width: 1),
                  //           ),
                  //           child: TextButton(
                  //             onPressed: () {},
                  //             child: Text(
                  //               "Panel Gönderilerim",
                  //               style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         border: Border.all(color: Colors.black, width: 1),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(4.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(14),
                  //             border: Border.all(color: Colors.black, width: 1),
                  //           ),
                  //           child: TextButton(
                  //             onPressed: () {},
                  //             child: Text(
                  //               "Eğitimlerim",
                  //               style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.list_alt_rounded,size: 45 ,),
                      Icon(Icons.library_books_sharp,size: 45 ,),
                      Icon(Icons.menu_book_sharp,size: 45 ,),
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Column(
  children: [
    for (int i = 0; i < posts.length; i += 2)
      if (i + 1 < posts.length) 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                if (_users.any((user) => user.id == posts[i].user_id) &&
                    _followedPanels.any((panel) => panel.id == posts[i].panel_id))
                  Column(
                    children: [
                      postProfile(
                        context,
                        posts[i],
                        _followedPanels.firstWhere((panel) => panel.id == posts[i].panel_id),
                        _users.firstWhere((user) => user.id == posts[i].user_id),
                        _comments,
                        _users,
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
              ],
            ),
            Column(
              children: [
                if (_users.any((user) => user.id == posts[i + 1].user_id) &&
                    _followedPanels.any((panel) => panel.id == posts[i + 1].panel_id))
                  Column(
                    children: [
                      postProfile(
                        context,
                        posts[i + 1],
                        _followedPanels.firstWhere((panel) => panel.id == posts[i + 1].panel_id),
                        _users.firstWhere((user) => user.id == posts[i + 1].user_id),
                        _comments,
                        _users,
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
              ],
            ),
          ],
        ),
  ],
),

                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, MyProfilePage( profileUserId: user.id), _followedPanels),
        ],
      )),
    );
  }
}
