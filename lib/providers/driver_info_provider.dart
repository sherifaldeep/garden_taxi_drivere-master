import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_cab_driver/models/driver_info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DriverInfoProvider extends ChangeNotifier {
  String token;
  void getToken(String tokens) {
    token = tokens;
    notifyListeners();
  }

  Future<DriverInfo> getDriverDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenLogin = prefs.getString("driverLoginToken");
    var tokenRegister = prefs.getString("driverRegisterToken");
    DriverInfo info;

    try {
      String url = "https://gardentaxi.net/Back_End/public/api/driver/user";
      var addTokenReponse = await http.post(
        url,
        body: {
          "api_token": tokenLogin ?? tokenRegister,
        },
      );
      var decodedData = jsonDecode(addTokenReponse.body);
      print(decodedData);
      info = DriverInfo(
        id: decodedData["data"]['id'],
        name: decodedData["data"]['name'],
        phone: decodedData['data']['phone'],
      );
    } catch (e) {
      print(e);
    }
    return info;
  }
}
