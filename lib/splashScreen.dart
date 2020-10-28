import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_cab_driver/Language/LanguageData.dart';
import 'package:my_cab_driver/introduction/introductionScreen.dart';
import 'package:my_cab_driver/constance/constance.dart' as constance;
import 'package:my_cab_driver/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    myContext = context;
    Timer(Duration(seconds: 3), () {
     // _loadNextScreen();
    });
    super.initState();
  }

  BuildContext myContext;

  // _loadNextScreen() async {
  //   if (!mounted) return;
  //   if (constance.allTextData == null) {
  //     constance.allTextData = AllTextData.fromJson(json.decode(
  //         await DefaultAssetBundle.of(myContext)
  //             .loadString("jsonFile/languagetext.json")));
  //   }
  //   await Future.delayed(const Duration(milliseconds: 1200));
  //   Navigator.pushReplacementNamed(context, Routes.Languages);
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/splash/splash1.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: height,
            ),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
