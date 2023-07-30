import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/core/utils/image_constant.dart';
import 'package:yatirimci_uygulamamiz/core/utils/size_utils.dart';
import 'package:yatirimci_uygulamamiz/screens/Auth/registerPage.dart';
import 'package:yatirimci_uygulamamiz/theme/app_decoration.dart';
import 'package:yatirimci_uygulamamiz/theme/text_theme_helper.dart';
import 'package:yatirimci_uygulamamiz/theme/theme_helper.dart';
import 'package:yatirimci_uygulamamiz/widgets/custom_image_view.dart';
import 'package:yatirimci_uygulamamiz/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

import '../HomePage.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key})
      : super(
          key: key,
        );

  Future<void> loginUser(String identifier, String password) async {
  final url = 'http://192.168.56.1:8000/api/auth/login'; // Laravel API'nizin URL'sini buraya yazın

  final Map<String, String> bodyData = {
    'identifier': identifier,
    'password': password,
  };

  final response = await http.post(
    Uri.parse(url),
    body: bodyData,
  );

  if (response.statusCode == 201) {
    final responseData = json.decode(response.body);
    final accessToken = responseData['access_token'];
    print(accessToken);
    print("Giriş başarılı.");
  } else {
    final responseData = json.decode(response.body);
    final errorMessage = responseData['identifier'][0];
    print(errorMessage);
  }
}
String identifier = "";
String password = "";

TextEditingController identifierController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                     Align(
                      alignment: Alignment.topCenter,
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
                          left: 15,
                          top: 33,
                          right: 6,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("YATIRIMCI UYUGULAMAMIZ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),)],),
                            Container(
                              margin: getMargin(
                                left: 22,
                                top: 20,
                                right: 36,
                              ),
                              padding: getPadding(
                                left: 15,
                                top: 16,
                                right: 15,
                                bottom: 8,
                              ),
                              decoration: AppDecoration.outline.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder15,
                              ),
                              child: CustomTextFormField(
                                height: 30,
                                alignment: Alignment.center,
                                enabledBorderDecoration: InputBorder.none,
                                focusedBorderDecoration: InputBorder.none,
                                hintText: 'Kullanıcı adı/ Email',
                                controller: identifierController,
                              
                              ),
                            ),
                            Container(
                              margin: getMargin(
                                left: 22,
                                top: 11,
                                right: 36,
                              ),
                              padding: getPadding(
                                left: 16,
                                top: 14,
                                right: 16,
                                bottom: 8,
                              ),
                              decoration: AppDecoration.outline.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder15,
                              ),
                              child: Padding(
                                padding: getPadding(
                                  top: 2,
                                ),
                                
                                child: CustomTextFormField(
                                  enabledBorderDecoration: InputBorder.none,
                                  focusedBorderDecoration: InputBorder.none,
                                  height: 30,
                                  hintText: 'Parola',
                                  controller: passwordController,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  identifier = "";

                                },
                                child: Container(
                                  margin: getMargin(
                                    top: 14,
                                    right: 36,
                                  ),
                                  padding: getPadding(
                                    left: 28,
                                    top: 11,
                                    right: 28,
                                    bottom: 11,
                                  ),
                                  decoration: AppDecoration.outline.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder15,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: 1,
                                        ),
                                        child: SizedBox(
                                          width: 50,
                                          height: 20,
                                          child: TextButton(
                                            style: ButtonStyle(
                                              padding: MaterialStatePropertyAll(EdgeInsets.zero)
                                            ),
                                            child: Text('Giriş Yap',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                            ),
                                            ),
                                            onPressed: () {
                                              identifier = identifierController.text;
                                              password = passwordController.text;
                                              if (identifier.isEmpty ||
                                                  password.isEmpty) {
                                                print("Boş alan bırakmayınız.");
                                              } else {
                                                loginUser(identifier, password);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: getMargin(
                                  top: 6,
                                  right: 37,
                                ),
                                decoration: AppDecoration.txtOutline,
                                child: Text(
                                  "Şifreni mi unuttun?",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 21,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 5,
                                      bottom: 10,
                                    ),
                                    child: SizedBox(
                                      width: getHorizontalSize(
                                        134,
                                      ),
                                      child: Divider(
                                        height: getVerticalSize(
                                          1,
                                        ),
                                        thickness: getVerticalSize(
                                          1,
                                        ),
                                        color: appTheme.gray400,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "veya",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextThemeHelper
                                        .bodyMediumRockwellGray400,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 5,
                                      bottom: 10,
                                    ),
                                    child: SizedBox(
                                      width: getHorizontalSize(
                                        134,
                                      ),
                                      child: Divider(
                                        height: getVerticalSize(
                                          1,
                                        ),
                                        thickness: getVerticalSize(
                                          1,
                                        ),
                                        color: appTheme.gray400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: getMargin(
                                  left: 25,
                                  top: 29,
                                  right: 33,
                                ),
                                padding: getPadding(
                                  left: 22,
                                  top: 9,
                                  right: 22,
                                  bottom: 9,
                                ),
                                decoration: AppDecoration.outline1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgFacebook,
                                      height: getVerticalSize(
                                        25,
                                      ),
                                      width: getHorizontalSize(
                                        28,
                                      ),
                                      margin: getMargin(
                                        bottom: 0,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                        top: 3,
                                        right: 17,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "Facebook ile giriş yap",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            TextThemeHelper.bodyMediumWhiteA700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: getMargin(
                                  left: 25,
                                  top: 12,
                                  right: 33,
                                ),
                                padding: getPadding(
                                  left: 26,
                                  top: 10,
                                  right: 26,
                                  bottom: 10,
                                ),
                                decoration: AppDecoration.outline2.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder15,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgGoogle,
                                      height: getSize(
                                        21,
                                      ),
                                      width: getSize(
                                        21,
                                      ),
                                      margin: getMargin(
                                        top: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                        top: 3,
                                        right: 33,
                                      ),
                                      child: Text(
                                        "Google ile giriş yap",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            TextThemeHelper.bodyMediumWhiteA700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: getMargin(
                                  left: 25,
                                  top: 12,
                                  right: 33,
                                ),
                                padding: getPadding(
                                  left: 29,
                                  top: 9,
                                  right: 29,
                                  bottom: 9,
                                ),
                                decoration: AppDecoration.outline3.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgVector,
                                      height: getVerticalSize(
                                        26,
                                      ),
                                      width: getHorizontalSize(
                                        21,
                                      ),
                                      margin: getMargin(
                                        bottom: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 20,
                                        top: 3,
                                        right: 38,
                                        bottom: 2,
                                      ),
                                      child: Text(
                                        "Apple ile giriş yap",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            TextThemeHelper.bodyMediumWhiteA700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: getPadding(
                                  top: 20,
                                  right: 48,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          return KayitScreen();
                                        },));
                                      },
                                      child: Container(
                                        margin: getMargin(
                                          bottom: 1,
                                        ),
                                        decoration: AppDecoration.txtOutline,
                                        child: Text(
                                          "Yatırımcı Uygulamamız’da yeni misin?",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 18,
                                        bottom: 3
                                      ),
                                      child: Text(
                                        "Kayıt Ol",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            TextThemeHelper.labelLargeExtraBold,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
