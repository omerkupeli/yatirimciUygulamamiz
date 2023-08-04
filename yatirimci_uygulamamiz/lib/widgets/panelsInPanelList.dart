import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';

import '../Models/Panel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  void followRoom(int panel_id) async {
    String ipAddress = "http://192.168.56.1:8000/api";
  Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 21|5s1hAtydZJSo3c5JOtEFsdSS3drVhN0vAbXszHPn',
};

    try {
      final response = await http.post(
        Uri.parse('$ipAddress/user-follow-panel/$panel_id'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Başarılı yanıt durumunda kullanıcıyı takip etme işlemi tamamlandı
        print('Room followed successfully');
      } else {
        // Hata durumunda hata mesajını alın ve işleyin
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'];
        print('Error: $errorMessage');
      }
    } catch (e) {
      // Hata oluşursa burada ele alın
      print('Error: $e');
    }
  }

Widget panelInPanelList(BuildContext context, setState, isExpandedList, i,
     List<TextButton> subTitles, Panel panel) {
  var onPressed;
  String? imagePath = panel.image;
  String correctedImagePath = imagePath!.replaceAll("\\", "");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          setState(() {
            isExpandedList[panel.id] = !isExpandedList[
                panel.id]; // Tıklama durumuna göre genişletme işlemini gerçekleştiriyoruz
          });
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          panel.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        IconButton(onPressed: () {
                  followRoom(panel.id);
                }, icon: Icon(Icons.add_circle_outline), color: Colors.white, iconSize: 30,),
                      ],
                    ),
                    
                  ),
                  
                ),
                
                
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    )),
                Icon(
                  isExpandedList[panel.id]
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      if (isExpandedList[panel.id])
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int j = 0; j < subTitles.length; j++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 220,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ).copyWith(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InPanelPostsPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: subTitles[j],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      SizedBox(height: 10),
    ],
  );
}
