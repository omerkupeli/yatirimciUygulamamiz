import 'package:flutter/material.dart';

class PanelSettings extends StatefulWidget {
  const PanelSettings({Key? key}) : super(key: key);

  @override
  State<PanelSettings> createState() => _PanelSettingsState();
}

class _PanelSettingsState extends State<PanelSettings> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Panel Gönderileri'),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(children: [
                  const Text(
                    "Tüm panel gönderilerindeki yorumları kapat",
                    style: TextStyle(fontSize: 14),
                  ),
                  //checkbox
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ]),
                Row(children: [
                  const Text(
                    "Tüm panel gönderilerindeki beğenileri gizle",
                    style: TextStyle(fontSize: 14),
                  ),
                  //checkbox
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ]),
                Row(children: [
                  Container(
                    child: SizedBox(
                      height: 40,
                      width: 280,
                      child: const Text(
                        "Tüm panel gönderilerindeki paylaşımları kapat",
                        style: TextStyle(fontSize: 14),
                        maxLines: 3,
                      ),
                    ),
                  ),
                  //checkbox
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ]),
                Row(children: [
                  const Text(
                    "Tüm panel gönderilerindeki kaydeti kapat",
                    style: TextStyle(fontSize: 14),
                  ),
                  //checkbox
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ]),
                SizedBox(
                  height: 90,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 180,
                      child: const Text(
                        'Kaydet',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
