import 'package:flutter/material.dart%20';
import 'package:yatirimci_uygulamamiz/widgets/panelsInPanelList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Panel.dart';
import '../widgets/navBarBottom.dart';

class PanelsPage extends StatefulWidget {
  @override
  _PanelsPageState createState() => _PanelsPageState();
}

class _PanelsPageState extends State<PanelsPage> {

 List<Panel> _panels = [];
 List<Panel> _followedPanels = [];
  String ipAddress = "http://192.168.56.1:8000/api/";
  Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 21|5s1hAtydZJSo3c5JOtEFsdSS3drVhN0vAbXszHPn',
};

   Future<void> getAllPanels() async {
    final response =
        await http.get(Uri.parse('$ipAddress' 'allPanels'),
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










  List<bool> isExpandedList = List.generate(
      10,
      (index) =>
          false); // Her bir elementin genişletilip genişletilmediğini tutan liste
  List<TextButton> subtitles = [
    TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "Yatırım Stratejileri",
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
    TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Temel Analizler",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
    TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Teknik Analizler",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  ];

  get onPressed => null;

  @override
  void initState() {
    super.initState();
    getAllPanels();
    fetchFollowedPanels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Paneller"),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.search,
                  size: 35,
                  color: Colors.black,
                  opticalSize: 10,
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    for (var panel in _panels)
                      panelInPanelList(context, setState, isExpandedList, 1, subtitles , panel)
                  ],
                ),
              ),
            ),
            buildBottomNavBar(context, PanelsPage(), _followedPanels ),
          ],
        ),
      ),
    );
  }
}
