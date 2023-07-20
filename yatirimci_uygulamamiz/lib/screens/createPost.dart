import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _textEditingController = TextEditingController();
  String _imagePath = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _createPost() {
    String text = _textEditingController.text;
    // Burada postu oluşturma işlemlerini yapabilirsiniz (örneğin, API isteği gönderme vb.)
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Post Oluştur'),
          backgroundColor: Colors.blue, // AppBar'ın arka plan rengi
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Resim seçme işlemleri burada gerçekleştirilebilir (galeriye erişim vb.)
                    setState(() {
                      _imagePath =
                          'assets/images/example_image.jpg'; // Seçilen resmin yolunu buraya atayın
                    });
                  },
                  child: Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          BorderRadius.circular(10), // Kenarlık yuvarlaklığı
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Gölgelendirme ayarı
                        ),
                      ],
                    ),
                    child: _imagePath.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _imagePath,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(Icons.add_photo_alternate, size: 40),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Yazınızı girin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Metin alanı kenarlık yuvarlaklığı
                    ),
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Metin alanının arka plan rengi
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _createPost,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Düğme rengi
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Düğme kenarlık yuvarlaklığı
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Düğme iç boşluğu
                  ),
                  child: Text('Gönderi Oluştur'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
