import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/screens/InPanels/Rooms.dart';

class InPanelsPage extends StatefulWidget {
  const InPanelsPage({Key? key}) : super(key: key);

  @override
  State<InPanelsPage> createState() => _InPanelsPageState();
}

class _InPanelsPageState extends State<InPanelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Panel 1 ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
            Icon(Icons.search, size: 35)
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: Column(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomsPage()),
                );
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Yatırım Stratejileri",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.forward_outlined,
                        size: 30,
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Temel Analizler",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.forward_outlined,
                      size: 30,
                    )),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Teknik Analizler",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.forward_outlined,
                      size: 30,
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
