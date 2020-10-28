import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/drawer/drawer.dart';
import 'package:my_cab_driver/main.dart';
import 'package:my_cab_driver/models/driver_info.dart';
import 'package:my_cab_driver/providers/driver_info_provider.dart';
import 'package:my_cab_driver/utilites/helpers.dart';
import 'package:my_cab_driver/vehicalManagement/vehicalmanagementScreen.dart';
import 'package:my_cab_driver/documentManagement/docManagementScreen.dart';
import 'package:provider/provider.dart';
import '../appTheme.dart';
import 'myProfile.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white70,
      appBar: appBar(),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75 < 400
            ? MediaQuery.of(context).size.width * 0.75
            : 350,
        child: Drawer(
          child: AppDrawer(
            selectItemName: 'Setting',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
                myProfileDetail(),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
                userSettings(),
                SizedBox(
                  height: 16,
                ),
                userDocs(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userDocs() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // InkWell(
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, Routes.NOTIFICATION);
          //   },
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
          //     child: Row(
          //       children: <Widget>[
          //         Container(
          //           height: 26,
          //           width: 26,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(6),
          //             color: staticGreenColor,
          //           ),
          //           child: Padding(
          //             padding: EdgeInsets.all(4),
          //             child: Icon(
          //               FontAwesomeIcons.solidBell,
          //               size: 16,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 16,
          //         ),
          //         Text(
          //           AppLocalizations.of('Notification'),
          //           style: headLineStyle.copyWith(fontSize: 16.0),
          //         ),
          //         Expanded(child: SizedBox()),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           size: 18,
          //           color: staticGreenColor,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: Container(height: 1, color: Colors.black12),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: staticGreenColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      FontAwesomeIcons.crown,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  getTranslated(context,'Terms & Privacy Policy'),
                  style: headLineStyle.copyWith(fontSize: 16.0),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: staticGreenColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Container(
              height: 1,
              color: Colors.black12,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: staticGreenColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.help,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  getTranslated(context,'Contact Us'),
                  style: headLineStyle.copyWith(fontSize: 16.0),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: staticGreenColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget userSettings() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicalManagement(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: staticGreenColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        FontAwesomeIcons.car,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    getTranslated(context,'vehicle Management'),
                    style: headLineStyle.copyWith(fontSize: 16.0),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: staticGreenColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: Container(height: 1, color: Colors.black12),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocmanagementScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: staticGreenColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        FontAwesomeIcons.idCard,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    getTranslated(context,'Document Management'),
                    style: headLineStyle.copyWith(fontSize: 16.0),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: staticGreenColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Container(
              height: 1,
              color: Colors.black12,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: staticGreenColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  getTranslated(context,'Reviews'),
                  style: headLineStyle.copyWith(fontSize: 16.0),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: staticGreenColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: Container(height: 1, color: Colors.black12),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfile(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 14, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: staticGreenColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        FontAwesomeIcons.globeAsia,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    getTranslated(context,'Language'),
                    style: headLineStyle.copyWith(fontSize: 16.0),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: staticGreenColor,
                  ),
                ],
              ),
            ),
          ),
          Container(height: 1, color: Colors.black12),
        ],
      ),
    );
  }

  Widget myProfileDetail() {
    var data = Provider.of<DriverInfoProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyProfile(),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 14, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/profile_icon.png",
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              FutureBuilder(
                  future: data.getDriverDetails(),
                  builder: (context, AsyncSnapshot<DriverInfo> snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data.name,
                          style: headLineStyle.copyWith(fontSize: 20.0),
                        ),
                      ],
                    );
                  }),
              Expanded(child: SizedBox()),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: staticGreenColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          SizedBox(
            height: AppBar().preferredSize.height,
            width: AppBar().preferredSize.height + 40,
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                        ),
                      ]),
                  child: Icon(
                    Icons.dehaze,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              getTranslated(context,'Settings'),
              style:
                  headLineStyle.copyWith(color: Colors.black, fontSize: 20.0),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: AppBar().preferredSize.height,
          ),
        ],
      ),
      actions: [
        Container(
          child: Image.asset(
            "assets/images/setting_effect.PNG",
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
