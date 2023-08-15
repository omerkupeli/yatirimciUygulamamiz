import 'package:flutter/material.dart';

import '../Models/Panel.dart';
import '../widgets/navBarBottom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchingPage extends StatefulWidget {
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {

   List<Panel> _followedPanels = [];
  String ipAddress = "http://192.168.56.1:8000/api/";
  Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 23|WiCIQE2rYh9w45QBy6ZZk9v9ruhjKS79fh15U7zk',
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
  @override
  void initState() {
    super.initState();
    fetchFollowedPanels();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searching Page"),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Searching Page"),
                ],
              ),
            ),
          ),
          buildBottomNavBar(context, SearchingPage(), _followedPanels),
        ],
      )),
    );
  }
}
