

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/ApiService.dart';
import 'package:yatirimci_uygulamamiz/screens/Auth/loginPage.dart';
import 'package:yatirimci_uygulamamiz/widgets/custom_text_form_field.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/text_theme_helper.dart';
import '../../theme/theme_helper.dart';
//import http
import 'package:http/http.dart' as http;

class KayitScreen extends StatelessWidget {
  KayitScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController rectangletwoController = TextEditingController();

  TextEditingController rectangletwoController1 = TextEditingController();

  TextEditingController rectangletwoController2 = TextEditingController();

  TextEditingController rectangletwoController3 = TextEditingController();
  
  String _name = "";
  String _email = "";
  String _password = "";

  Future<void> registerUser(String name, String email, String password) async {
  final url = 'http://192.168.56.1:8000/api/auth/register'; // Laravel API'nizin URL'sini buraya yazın

  final response = await http.post(
    Uri.parse(url),
    body: {
      'name': name,
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 201) {
    final responseData = json.decode(response.body);
    final accessToken = responseData['access_token'];
    print(accessToken);
    print("başarıyla kayıt oldunuzdenem");

  } else {
    final responseData = json.decode(response.body);
    final errorMessage = responseData['error'];
    print(errorMessage);
  }
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 10,
              top: 7,
              right: 10,
              bottom: 7,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  
                  width: getHorizontalSize(
                    340,
                  ),
                  margin: getMargin(
                    top: 1,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: getPadding(
                            left: 13,
                            top: 14,
                            right: 13,
                            bottom: 14,
                          ),
                          decoration: AppDecoration.outline4.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: getVerticalSize(
                                  595,
                                ),
                                width: getHorizontalSize(
                                  312,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      15,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: appTheme.black900,
                                    width: getHorizontalSize(
                                      2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: getPadding(
                            left: 41,
                            top: 51,
                            right: 36,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Powark’a Kayıt Ol",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 3,
                                  top: 23,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: getPadding(
                                          right: 5,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                left: 4,
                                              ),
                                              child: Text(
                                                "Ad",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                            CustomTextFormField(
                                              width: getHorizontalSize(
                                                125,
                                              ),
                                              focusNode: FocusNode(),
                                              autofocus: true,
                                              controller: rectangletwoController,
                                              margin: getMargin(
                                                top: 4,
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: getPadding(
                                          left: 5,
                                          top: 1,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                left: 4,
                                              ),
                                              child: Text(
                                                "Soyad",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                            CustomTextFormField(
                                              width: getHorizontalSize(
                                                125,
                                              ),
                                              focusNode: FocusNode(),
                                              autofocus: true,
                                              controller: rectangletwoController1,
                                              margin: getMargin(
                                                top: 2,
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 3,
                                  top: 9,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 5,
                                      ),
                                      child: Text(
                                        "Kullanıcı adı veya e-posta",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextThemeHelper.bodyMedium13,
                                      ),
                                    ),
                                    CustomTextFormField(
                                      focusNode: FocusNode(),
                                      autofocus: true,
                                      controller: rectangletwoController2,
                                      margin: getMargin(
                                        top: 6,
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 3,
                                  top: 9,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 5,
                                      ),
                                      child: Text(
                                        "Şifre",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    CustomTextFormField(
                                      focusNode: FocusNode(),
                                      autofocus: true,
                                      controller: rectangletwoController3,
                                      margin: getMargin(
                                        top: 5,
                                      ),
                                      
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 3,
                                  top: 9,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Doğum Tarihi",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 6,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: getPadding(
                                              left: 17,
                                              top: 11,
                                              right: 17,
                                              bottom: 11,
                                            ),
                                            decoration:
                                                AppDecoration.outline.copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Gün",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: getPadding(
                                              left: 23,
                                              top: 10,
                                              right: 23,
                                              bottom: 10,
                                            ),
                                            decoration:
                                                AppDecoration.outline.copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: getPadding(
                                                    top: 2,
                                                  ),
                                                  child: Text(
                                                    "Ay",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: getPadding(
                                              left: 44,
                                              top: 11,
                                              right: 44,
                                              bottom: 11,
                                            ),
                                            decoration:
                                                AppDecoration.outline.copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: getPadding(
                                                    bottom: 1,
                                                  ),
                                                  child: Text(
                                                    "Yıl",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
  onTap: () {
    _name = rectangletwoController.text + " " + rectangletwoController1.text;
    _email = rectangletwoController2.text;
    _password = rectangletwoController3.text;

    if (_name.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty) {
      registerUser(_name, _email, _password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
        
      
    } else {
      
      print("hata");
      
    }

    
    
  },
  child: Container(
    width: getHorizontalSize(113),
    margin: getMargin(left: 72, top: 71, right: 78),
    padding: getPadding(left: 30, top: 10, right: 30, bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Colors.black), // Kenarlık rengini buradan ayarlayabilirsiniz.
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: getPadding(top: 2),
          child: Text(
            "Kayıt Ol",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: theme.textTheme.labelLarge,
          ),
        ),
      ],
    ),
  ),
),

                            ],
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
