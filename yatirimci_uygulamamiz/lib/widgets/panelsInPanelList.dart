import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/InPanelPosts.dart';

import '../screens/InPanels/Rooms.dart';

Widget panelInPanelList(BuildContext context, setState, isExpandedList, i,
    String title, List<TextButton> subTitles) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          setState(() {
            isExpandedList[i] = !isExpandedList[
                i]; // Tıklama durumuna göre genişletme işlemini gerçekleştiriyoruz
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
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Icon(
                  isExpandedList[i]
                      ? Icons.arrow_drop_up
                      : Icons
                          .arrow_drop_down, // Genişletilmiş duruma göre ok işareti
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      if (isExpandedList[i]) // Genişletilmiş durumda ise seçenekleri göster
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // İlgili seçenekleri burada listeleyebilirsiniz
            // list subtitles
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
