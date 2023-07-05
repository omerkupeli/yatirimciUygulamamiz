import "package:flutter/material.dart ";

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesabım"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Row(
              children: [
                Text("Kullanıcı Bilgilerim",
                    style: Theme.of(context).textTheme.headline6),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.forward,
                      size: 30,
                    )),
              ],
            ),
            Row(
              children: [
                Text("Şifremi Değiştir",
                    style: Theme.of(context).textTheme.headline6),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.forward,
                      size: 30,
                    )),
              ],
            ),
            Row(
              children: [
                Text("İki Faktörlü Doğrulama",
                    style: Theme.of(context).textTheme.headline6),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.forward,
                      size: 30,
                    )),
              ],
            ),
            Row(
              children: [
                Text("Hesabımı Sil",
                    style: Theme.of(context).textTheme.headline6),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.forward,
                      size: 30,
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
