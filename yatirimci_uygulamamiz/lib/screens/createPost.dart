import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yatirimci_uygulamamiz/screens/HomePage.dart';
import 'package:yatirimci_uygulamamiz/screens/publishPost.dart';
import 'package:yatirimci_uygulamamiz/widgets/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class CreatePostScreen extends StatefulWidget {
  final int panelId;

  CreatePostScreen({Key? key, required this.panelId}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}


class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _bodyController = TextEditingController();
 
  String _imagePath = '';
  String _videoPath = '';
  bool _isImageSelected = false;
  bool _isVideoSelected = false;
  int _panelId = 0;


  Future<void> createPost(String body, String image, int panelId) async {
  final url = 'http://192.168.56.1:8000/api/create-post';
  final Map<String, String> headers = {
    'Authorization': 'Bearer 23|WiCIQE2rYh9w45QBy6ZZk9v9ruhjKS79fh15U7zk',   };

  final Map<String, String> bodyData = {
    'body': body,
    'panel_id': panelId.toString(),
  };

  if (image != null) {
    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll(headers)
      ..fields.addAll(bodyData)
      ..files.add(await http.MultipartFile.fromPath('image', image));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      print("Post created successfully");
    } else {
      print("Failed to create post");
      print(response.body);
    }
  } else {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: bodyData,
    );

    if (response.statusCode == 201) {
      print("Post created successfully");
    } else {
      print("Failed to create post");
      print(response.body);
    }
  }
}
@override 
  void initState() {
    super.initState();
    _panelId = widget.panelId;
  }


  @override
  void dispose() {
    _bodyController.dispose();
    super.dispose();
  }
  bool fotografEkle = false;
  void onPressedFotografEkle() {
    setState(() {
      fotografEkle = !fotografEkle;
    });
  }

  bool videoEkle = false;
  void onPressedVideofEkle() {
    setState(() {
      videoEkle = !videoEkle;
    });
  }
   Future<void> _selectImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        _isImageSelected = true;
      });
    }
  }
  Future<void> _selectVideo() async {
    final pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoPath = pickedFile.path;
        _isVideoSelected = true;
      });
    }
  }
   Widget _buildVideoPlayer() {
  final videoPlayerController = VideoPlayerController.file(File(_videoPath));
  final chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: false,
  );

  return Chewie(controller: chewieController);
}

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gönderi'),
          centerTitle:true ,
          backgroundColor: Colors.blue, // AppBar'ın arka plan rengi
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  SizedBox(height: 16),
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey,width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _bodyController,
                      decoration: InputDecoration(
                        hintText: 'Bir Gönderi Oluşturun',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10), 
                        ),
                        filled: true,
                        fillColor:
                            Colors.grey[200],
                      ),
                      maxLines: 4,
                    ),
                  ),
                  ),
                  SizedBox(height: 16),
                  fotografEkle ?
                  Column(
                    children: [
                      SizedBox(height: 16)  ,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ) ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              _selectImage();
                            },
                            child: Container(
                              width: 400,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _isImageSelected
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(_imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_photo_alternate,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Fotoğraf Seçin",
                                            style: TextStyle(fontSize: 20, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey, 
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), 
                              ),
                            ),
                            onPressed: () {
                              onPressedFotografEkle();
                            }, child: Text("Filtreler")  ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey, 
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), 
                              ),
                            ),
                            onPressed: () {
                              onPressedFotografEkle();
                            }, child: Text("Düzenle")  ),
                        ],
                      )
                    ],
                  )
                  : Container(),
                  videoEkle ?
                  Column(
                    children: [
                      Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ) ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                          onTap: () {
                            _selectVideo();
                          },
                          child: Container(
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _isVideoSelected
                              ? _buildVideoPlayer()
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.video_call,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Video Seçin",
                                        style: TextStyle(fontSize: 20, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                          ),
                                          ),
                                          
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey, 
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), 
                                  ),
                                ),
                                onPressed: () {
                                  onPressedFotografEkle();
                                }, child: Text("Düzenle")  ),
                        ],
                      ),
                    ],
                  )
                : Container(),
                  SizedBox(height: 16),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [GestureDetector(
                    onTap: () {
                      onPressedFotografEkle();
                      if (videoEkle == true) {
                        videoEkle = false;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey,width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                           Text("foto ekle")
                          ],
                        ),
                      ),
                    ),
                    
                  ),
                  GestureDetector(
                    onTap: () {
                      onPressedVideofEkle();
                      if (fotografEkle == true) {
                        fotografEkle = false;
                      }
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey,width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("video ekle")
                          ],
                        ),
                      ),
                    ),
                  )
                  ],
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                  onTap: () {
                    onPressed();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Kişileri Etiketle",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  ),
                  SizedBox(height: 16),
                                GestureDetector(
                  onTap: () {
                    onPressed();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10), // Kenarlık yuvarlaklığı
                      border: Border.all(color: Colors.grey,width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Konumu Ekle",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, 
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  onPressed: () async {
                    String body = _bodyController.text;
                    await createPost(body, _imagePath , _panelId );
                  
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }, child: Text("Paylaş")  ),
                  SizedBox(height: 16),

                  
                 
                ],
          
            ),
            
          
                  ),
          ),

      ),
    ),
    );
  }
}
