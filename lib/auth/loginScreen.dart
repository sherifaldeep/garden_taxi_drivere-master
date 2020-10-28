import 'dart:convert';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:my_cab_driver/auth/phoneAuthScreen.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
import 'package:http/http.dart' as http;
import 'package:my_cab_driver/loading.dart';
import 'package:my_cab_driver/main.dart';
import 'package:my_cab_driver/providers/driver_info_provider.dart';
import 'package:my_cab_driver/utilites/helpers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  void _loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Loading(status: "Loading"),
    );
  }

  void _userNotFound() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        contentPadding: EdgeInsets.all(20.0),
        title: Text(
          "Sorry User Not Found",
          style: headLineStyle.copyWith(fontSize: 20),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Ok",
              style: describtionStyle.copyWith(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  void loginInDriver() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _loading();
    try {
      String url = "https://gardentaxi.net/Back_End/public/api/driver/login";
      var dataBody = {
        "phone": phoneController.text,
        "password": passController.text,
      };
      var response = await http.post(url, body: dataBody);
      if (response.statusCode == 200) {
        if (response.body.contains("success")) {
          var dataDcoded = jsonDecode(response.body);
          prefs.setString(
              "driverLoginToken", dataDcoded["data"][0]['api_token']);
          var tokens = dataDcoded["data"][0]['api_token'];
          Provider.of<DriverInfoProvider>(context, listen: false)
              .getToken(tokens);

          Navigator.pop(context);
          phoneController.clear();
          passController.clear();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.SelectDstrict, (route) => false);
        } else {
          Navigator.pop(context);
          _userNotFound();
          phoneController.clear();
          passController.clear();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _getPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginToken = prefs.getString("driverLoginToken");
    if (loginToken != null) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
    }
  }

  @override
  void initState() {
    _getPrefrences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: 220,
            color: staticGreenColor,
            child: Animator(
              tween: Tween<Offset>(
                begin: Offset(0, 0.4),
                end: Offset(0, 0),
              ),
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => SlideTransition(
                position: anim,
                child: Image.asset(
                  ConstanceData.splashBackground,
                  fit: BoxFit.fill,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(color: staticGreenColor),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 18, right: 18),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      getTranslated(context,'Login'),
                                      style: headLineStyle,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        getTranslated(context,' With Your'),
                                        style: describtionStyle.copyWith(
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      getTranslated(context,'phone number'),
                                      style: describtionStyle.copyWith(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) => value.isEmpty
                                      ? "You Should Enter Phone Number"
                                      : null,
                                  controller: phoneController,
                                  autofocus: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    isDense: true,
                                    hintText: 'Phone Number',
                                    hintStyle: describtionStyle.copyWith(
                                        color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  validator: (value) => value.isEmpty
                                      ? "You Should Enter Password"
                                      : null,
                                  controller: passController,
                                  autofocus: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    isDense: true,
                                    hintText: 'password',
                                    hintStyle: describtionStyle.copyWith(
                                        color: Colors.black26),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    if (_formkey.currentState.validate()) {
                                      loginInDriver();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: staticGreenColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        getTranslated(context,'NEXT'),
                                        style: buttonsText,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
