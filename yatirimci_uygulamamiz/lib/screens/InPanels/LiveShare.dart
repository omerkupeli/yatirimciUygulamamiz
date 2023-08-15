import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/widgets/navBarBottomForRoom.dart';

class LiveSharePage extends StatefulWidget {
  const LiveSharePage({Key? key}) : super(key: key);

  @override
  _LiveSharePageState createState() => _LiveSharePageState();
}

class _LiveSharePageState extends State<LiveSharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Share"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [buildBottomNavBarForRoom(context, LiveSharePage())],
          ),
        )
        
      ),
    );
  }
}
