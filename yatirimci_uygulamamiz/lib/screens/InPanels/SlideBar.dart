import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtkRqqG1UjXllBfGYA2Avfeyp4prhTpAIwWw&usqp=CAU'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Onur Beyin Odası',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_forward_sharp),
                  Text(
                    "Yazılı Sohbet Odaları",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Icon(Icons.add_circle_outline),
            ],
          ),
          ListTile(
            leading: Icon(Icons.tag),
            title: Text('Yatırım Stratejileri'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.tag),
            title: Text('Temel Analizler'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.tag),
            title: Text('Teknik Analizler'),
            onTap: () => null,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_forward_sharp),
                  Text(
                    "Sesli Sohbet Odaları",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Icon(Icons.add_circle_outline),
            ],
          ),
          ListTile(
            leading: Icon(Icons.volume_up_outlined),
            title: Text('Sesli Sohbet Odası1'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.volume_up_outlined),
            title: Text('Sesli Sohbet Odası2'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
