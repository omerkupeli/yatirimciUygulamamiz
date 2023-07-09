import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/SlideBar.dart';
import '../../widgets/navBarBottomForRoom.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Chat Room',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Text("chat room")],
          ),
        ),
      ),
    );
  }
}
