import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/post2.dart';

import '../../widgets/navBarBottomForRoom.dart';

class InPanelPostsPage extends StatefulWidget {
  const InPanelPostsPage({Key? key}) : super(key: key);

  @override
  _InPanelPostsPageState createState() => _InPanelPostsPageState();
}

class _InPanelPostsPageState extends State<InPanelPostsPage> {
  bool _showBottomNavBar = true; // Duruma bağlı olarak alt gezinme çubuğunu göstermek için kullanacağız.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            // Kullanıcı aşağı doğru kaydırdığında alt gezinme çubuğunu gizleyin, yukarı kaydırınca gösterin.
            if (scrollNotification is ScrollUpdateNotification) {
              setState(() {
                _showBottomNavBar = scrollNotification.scrollDelta! < 0;
              });
            }
            return true;
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true, // App bar'ın sabit kalmasını sağlar.
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Yatırım Stratejileri",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Icon(Icons.search, size: 35),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 70),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          // post2(context, 1),
                          SizedBox(height: 14),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 400,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Resim',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: 10, // Örnek olarak 10 adet öğe ekliyorum.
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
