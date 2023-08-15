import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/ApiService.dart';
import 'package:yatirimci_uygulamamiz/Models/Comment.dart';
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
  List<Comment> _comments = [];
  String ipAddress = "http://192.168.56.1:8000/api/";
  Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 23|WiCIQE2rYh9w45QBy6ZZk9v9ruhjKS79fh15U7zk',
};

 
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
            

        if (posts.length > 0) {
          for (var post in posts) {
          getUserById(post.user_id);
          getPanelById(post.panel_id);
          fetchComments(post.id);
        }
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
  User user = User(id: 1, name: "name", email: "email", username: "username", password: "password", image: "http://192.168.56.1:8000/storage/posts/-1690794550.jpg");
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

  get onPressed => null;
  //push profilepage
  void onPressed2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyProfilePage( profileUserId: user.id,)),
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
                  Column(
  children: [
    for (var post in posts)
      if (_users.any((user) => user.id == post.user_id) &&
          _followedPanels.any((panel) => panel.id == post.panel_id))
        Column(
          children: [
            post2(context, 1, post, _users.firstWhere((user) => user.id == post.user_id), _followedPanels.firstWhere((panel) => panel.id == post.panel_id),_comments ,_users),
            SizedBox(height: 20),
          ],
        ),
  ],
)

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
