import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/ApiService.dart';
import 'package:yatirimci_uygulamamiz/Models/Panel.dart';
import 'package:yatirimci_uygulamamiz/Models/User.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/SlideBar.dart';
import 'package:yatirimci_uygulamamiz/screens/MyProfilePage.dart';
import 'package:yatirimci_uygulamamiz/widgets/buildNavIcon.dart';
import 'package:yatirimci_uygulamamiz/widgets/navBarBottom.dart';
import 'package:yatirimci_uygulamamiz/widgets/post.dart';
import 'package:http/http.dart' as http;

import '../Models/Post.dart';
import '../widgets/post2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  ApiService _apiService = ApiService();
  List<User> _users = [];
  List<Panel> _panels = [];
  List<Panel> _followedPanels = [];
  String ipAddress = "http://192.168.56.1:8000/api/";
  Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 13|ZPtf2IJwBPvb8OGYA6OJmk3RzYkzP2heJvvvxRwQ',
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

  

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$ipAddress' 'allPosts'),
    headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);

      setState(() {
        posts = responseData
            .map((data) => Post.fromJson(data))
            .toList()
            .cast<Post>();
            

        // Her bir post için ilgili kullanıcının bilgilerini al
        for (var post in posts) {
          getUserById(post.user_id);
          getPanelById(post.panel_id);
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

  @override
  void initState() {
    super.initState();
    fetchPosts();
    fetchFollowedPanels();
  }

  get onPressed => null;
  //push profilepage
  void onPressed2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yatırımcı Uygulamamız',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[800],
                    ),
                    child: IconButton(
                      onPressed: onPressed2,
                      icon: Icon(Icons.person),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Keşfet",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   for (var post in posts)
                     for (var user in _users)
                       for (var panel in _panels)
                         if (post.user_id == user.id &&
                             post.panel_id == panel.id)
                           Column(
                             children: [
                               post2(context, 1, post, user, panel),
                               SizedBox(
                                 height: 20,
                               ),
                             ],
                           ),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, HomePage() , _followedPanels),
        ],
      )),
    );
  }
}
