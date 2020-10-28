import 'dart:convert';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/auth/phoneAuthScreen.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
import 'package:my_cab_driver/loading.dart';
import 'package:my_cab_driver/main.dart';
import 'package:my_cab_driver/providers/driver_info_provider.dart';
import 'package:my_cab_driver/utilites/helpers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginScreen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  void _loading() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Loading(status: "Loading"),
    );
  }

  void alreadyRegistered() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          "You Already Registered",
          style: headLineStyle.copyWith(fontSize: 20.0),
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

  void registerDriver() async {
    _loading();
    try {
      String url = "https://gardentaxi.net/Back_End/public/api/driver/register";
      var dataBody = {
        "name": nameController.text,
        "phone": phoneController.text,
        "password": passController.text,
      };
      var response = await http.post(url, body: dataBody);
      if (response.statusCode == 200) {
        var dataDecoded = jsonDecode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString(
            "driverRegisterToken", dataDecoded["data"]['api_token']);
        var tokens = dataDecoded["data"]['api_token'];
        Provider.of<DriverInfoProvider>(context, listen: false)
            .getToken(tokens);
        Navigator.pop(context);
        nameController.clear();
        phoneController.clear();
        passController.clear();
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.AddVehicle, (route) => false);
      } else {
        Navigator.pop(context);
        alreadyRegistered();
        nameController.clear();
        phoneController.clear();
        passController.clear();
      }
    } catch (e) {
      print(e);
    }
  }

  var appBarheight = 0.0;
  String codeNum = "+20";
  void _getPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var drivertoken = prefs.getString("driverRegisterToken");
    var loginToken = prefs.getString("driverLoginToken");
    if (drivertoken != null || loginToken != null) {
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
    double height = MediaQuery.of(context).size.height;
    appBarheight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top - 20;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        height: height * 1.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: appBarheight),
                  Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: height * 0.3,
                            decoration: BoxDecoration(
                              color: staticGreenColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: <Widget>[
                                Animator(
                                  tween: Tween<Offset>(
                                    begin: Offset(0, 0.9),
                                    end: Offset(0, 0),
                                  ),
                                  duration: Duration(seconds: 3),
                                  cycles: 1,
                                  builder: (anim) => SlideTransition(
                                    position: anim,
                                    child: Image.asset(
                                      ConstanceData.splashBackground,
                                      fit: BoxFit.cover,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 18, right: 18),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                          getTranslated(context,'Sign Up'),
                                            style: headLineStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                             getTranslated(context,' With'),
                                              style: headLineStyle.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            getTranslated(context,
                                                'email and phone'),
                                            style: headLineStyle.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            getTranslated(context,'number'),
                                            style: headLineStyle.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 14,
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                    validator: (value) => value.isEmpty
                                        ? "You Should Enter Full Name"
                                        : null,
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      hintText: 'Full Name',
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
                                    height: 14,
                                  ),
                                  TextFormField(
                                    controller: phoneController,
                                    validator: (value) => value.isEmpty
                                        ? "You Should Enter Phone Number"
                                        : null,
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
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
                                    height: 14,
                                  ),
                                  TextFormField(
                                    controller: passController,
                                    obscureText: true,
                                    validator: (value) => value.isEmpty
                                        ? "You Should Enter Password"
                                        : null,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      hintText: 'Password',
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
                                    height: 36,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        registerDriver();
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
                                          getTranslated(context,'SIGN UP'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .button
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getTranslated(context,'Already have an account?'),
                        style: describtionStyle,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.LOGIN);
                        },
                        child: Text(
                         getTranslated(context,' Sign In'),
                          style: skipButtons.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/images/effect.PNG",
                      height: 100.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
