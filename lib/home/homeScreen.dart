import 'package:animator/animator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/drawer/drawer.dart';
import 'package:my_cab_driver/home/riderList.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
import 'package:my_cab_driver/models/driver_info.dart';
import 'package:my_cab_driver/providers/driver_info_provider.dart';
import 'package:my_cab_driver/utilites/helpers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOffline = false;

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  GoogleMapController mapController;
  double lat = 37.43296265331129;
  double long = -122.08832357078792;

  void getMyLocation() async {
    Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 18.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              SizedBox(
                height: AppBar().preferredSize.height,
                width: AppBar().preferredSize.height + 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.dehaze),
                      color: Colors.blue,
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: !isOffline
                    ? Text(
                       getTranslated(context,'OffLine'),
                        style: headLineStyle.copyWith(
                            color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        getTranslated(context,'Online'),
                        style: headLineStyle.copyWith(
                            color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
                width: AppBar().preferredSize.height + 40,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    activeColor: staticGreenColor,
                    value: isOffline,
                    onChanged: (bool value) {
                      setState(() {
                        isOffline = !isOffline;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        key: _scaffoldKey,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75 < 400
              ? MediaQuery.of(context).size.width * 0.75
              : 350,
          child: Drawer(
            child: AppDrawer(
              selectItemName: 'Home',
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                padding: EdgeInsets.only(bottom: 170.0, top: 60),
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat, long),
                  zoom: 18.0,
                ),
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (controller) {
                  mapController = controller;
                  getMyLocation();
                }),
            !isOffline
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      offLineMode(),
                      Expanded(
                        child: SizedBox(),
                      ),
                      //myLocation(),
                      SizedBox(
                        height: 10,
                      ),
                      offLineModeDetail(),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(),
                      ),
                      // myLocation(),
                      SizedBox(
                        height: 10,
                      ),
                      onLineModeDetail(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget onLineModeDetail() {
    //var bootmPadding = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 0.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RiderList(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 16,
              child: Padding(
                padding: EdgeInsets.only(right: 24, left: 24),
                child: Animator(
                  tween: Tween<Offset>(
                    begin: Offset(0, 0.5),
                    end: Offset(0, 0),
                  ),
                  duration: Duration(milliseconds: 700),
                  cycles: 1,
                  builder: (anim) => SlideTransition(
                    position: anim,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 0,
              left: 0,
              bottom: 16.0,
              child: Padding(
                padding: EdgeInsets.only(right: 12, left: 12),
                child: Animator(
                  tween: Tween<Offset>(
                    begin: Offset(0, 0.5),
                    end: Offset(0, 0),
                  ),
                  duration: Duration(milliseconds: 700),
                  cycles: 1,
                  builder: (anim) => SlideTransition(
                    position: anim,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 6.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Animator(
              tween: Tween(
                begin: Offset(0, 0.4),
                end: Offset(0, 0),
              ),
              duration: Duration(milliseconds: 700),
              cycles: 1,
              builder: (anim) => SlideTransition(
                position: anim,
                child: Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/profile_icon.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                     getTranslated(context,'Esther Berry'),
                                      style: headLineStyle.copyWith(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 24,
                                          width: 74,
                                          child: Center(
                                            child: Text(
                                              getTranslated(context,'ApplePay'),
                                              style: buttonsText.copyWith(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: staticGreenColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          height: 24,
                                          width: 74,
                                          child: Center(
                                            child: Text(
                                             getTranslated(context,'Discount'),
                                              style: buttonsText.copyWith(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: staticGreenColor,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '00.00 LE',
                                      style: describtionStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '00.00 km',
                                      style: describtionStyle.copyWith(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.5,
                            color: Theme.of(context).disabledColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 14, left: 14, top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      getTranslated(context,'PICKUP'),
                                      style: describtionStyle.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "حدايق الأهرام بوابة خوفو الهضبة",
                                      style: describtionStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.5,
                            color: Colors.black26,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 14, left: 14, top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      getTranslated(context,'DROP OFF'),
                                      style: describtionStyle.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "ميدان الرماية شارع الهرم",
                                      style: describtionStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.5,
                            color: Theme.of(context).disabledColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 14, left: 14, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 32,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      getTranslated(context,'Ignore'),
                                      style: buttonsText.copyWith(
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 32,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: staticGreenColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      getTranslated(context,'ACCEPT'),
                                      style: buttonsText.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void setLDMapStyle() async {
  //   if (mapController != null) {
  //     if (AppTheme.isLightTheme) {
  //       mapController.setMapStyle(await DefaultAssetBundle.of(context)
  //           .loadString("jsonFile/lightmapstyle.json"));
  //     } else {
  //       mapController.setMapStyle(await DefaultAssetBundle.of(context)
  //           .loadString("jsonFile/darkmapstyle.json"));
  //     }
  //   }
  // }

  Widget offLineModeDetail() {
    var data = Provider.of<DriverInfoProvider>(context);
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: backGroundColors,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 14, left: 14),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 4,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  backgroundImage: AssetImage("assets/profile_icon.png"),
                ),
                SizedBox(
                  width: 8,
                ),
                FutureBuilder(
                  future: data.getDriverDetails(),
                  builder: (context, AsyncSnapshot<DriverInfo> snapshot) {
                    if (snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data.name,
                          style: headLineStyle.copyWith(fontSize: 18.0),
                        ),
                        Text(
                          getTranslated(context,'Basic level'),
                          style: describtionStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '00.00 LE',
                      style: headLineStyle.copyWith(fontSize: 18.0),
                    ),
                    Text(
                      getTranslated(context,'Earned'),
                      style: describtionStyle.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: staticGreenColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.clock,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 20,
                        ),
                        // Expanded(
                        //   child: SizedBox(),
                        // ),
                        // SizedBox(
                        //   height: 4,
                        // ),
                        Text(
                          '00.00',
                          style: describtionStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                             getTranslated(context,'HOURS ONLINE'),
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.tachometerAlt,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 20,
                        ),
                        // Expanded(
                        //   child: SizedBox(),
                        // ),
                        // SizedBox(
                        //   height: 4,
                        // ),
                        Text(
                          '00 KM',
                          style: describtionStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              getTranslated(context,'TOTAL DISTANCE'),
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.rocket,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 20,
                        ),
                        // Expanded(
                        //   child: SizedBox(),
                        // ),
                        // SizedBox(
                        //   height: 4,
                        // ),
                        Text(
                          '00.00',
                          style: describtionStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              getTranslated(context,'TOTAL JOBS'),
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myLocation() {
    return Padding(
      padding: EdgeInsets.only(right: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 12,
                  spreadRadius: -5,
                )
              ],
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.my_location,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Map<PolylineId, Polyline> getPolyLine(BuildContext context) {
  //   Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
  //   if (isOffline) {
  //     List<LatLng> latlng1 = [
  //       LatLng(51.506115, -0.088339),
  //       LatLng(51.507129, -0.087974),
  //       LatLng(51.509693, -0.087075),
  //       LatLng(51.509065, -0.082206),
  //       LatLng(51.509159, -0.081173),
  //       LatLng(51.509346, -0.080675),
  //       LatLng(51.509540, -0.080293),
  //       LatLng(51.509587, -0.080282)
  //     ];
  //     List<LatLng> latlng2 = [
  //       LatLng(51.505951, -0.086974),
  //       LatLng(51.506051, -0.087634),
  //       LatLng(51.506115, -0.088339)
  //     ];
  //     final PolylineId polylineId = PolylineId('polylineId');
  //     final Polyline polyline = Polyline(
  //       polylineId: polylineId,
  //       color: Theme.of(context).primaryColor,
  //       consumeTapEvents: false,
  //       points: latlng1,
  //       width: 4,
  //       startCap: Cap.roundCap,
  //       endCap: Cap.roundCap,
  //     );

  //     final PolylineId polylineId1 = PolylineId('polylineId1');
  //     List<PatternItem> patterns1 = [PatternItem.dot, PatternItem.gap(1)];
  //     final Polyline polyline1 = Polyline(
  //       polylineId: polylineId1,
  //       color: Theme.of(context).primaryColor,
  //       consumeTapEvents: false,
  //       points: latlng2,
  //       width: 4,
  //       startCap: Cap.roundCap,
  //       endCap: Cap.roundCap,
  //       patterns: patterns1,
  //     );
  //     _polylines.addAll({polylineId: polyline});
  //     _polylines.addAll({polylineId1: polyline1});
  //   }
  //   return _polylines;
  // }

  // Map<MarkerId, Marker> getMarkerList(BuildContext context) {
  //   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  //   final MarkerId markerId1 = MarkerId("markerId1");
  //   final MarkerId markerId2 = MarkerId("markerId2");
  //   final MarkerId markerId3 = MarkerId("markerId3");
  //   final Marker marker1 = Marker(
  //     markerId: markerId1,
  //     position: LatLng(lat, long),
  //     anchor: Offset(0.5, 0.5),
  //     icon: bitmapDescriptorStartLocation,
  //   );
  //   if (isOffline) {
  //     final Marker marker2 = Marker(
  //       markerId: markerId2,
  //       position: LatLng(lat2, long2),
  //       anchor: Offset(0.5, 0.5),
  //       icon: bitmapDescriptorStartLocation3,
  //     );

  //     final Marker marker3 = Marker(
  //       markerId: markerId3,
  //       position: LatLng(lat3, long3),
  //       anchor: Offset(0.5, 0.5),
  //       icon: bitmapDescriptorStartLocation2,
  //     );
  //     markers.addAll({markerId2: marker2});
  //     markers.addAll({markerId3: marker3});
  //   }
  //   markers.addAll({markerId1: marker1});
  //   return markers;
  // }

  // Future seticonimage3(BuildContext context) async {
  //   if (bitmapDescriptorStartLocation3 == null) {
  //     final ImageConfiguration imagesStartConfiguration3 =
  //         createLocalImageConfiguration(context);
  //     bitmapDescriptorStartLocation3 = await BitmapDescriptor.fromAssetImage(
  //       imagesStartConfiguration3,
  //       ConstanceData.mylocation3,
  //     );
  //     setState(() {});
  //   }
  // }

  // Future seticonimage2(BuildContext context) async {
  //   if (bitmapDescriptorStartLocation2 == null) {
  //     final ImageConfiguration imagesStartConfiguration2 =
  //         createLocalImageConfiguration(context);
  //     bitmapDescriptorStartLocation2 = await BitmapDescriptor.fromAssetImage(
  //       imagesStartConfiguration2,
  //       ConstanceData.mylocation2,
  //     );
  //     setState(() {});
  //   }
  // }

  // Future seticonimage(BuildContext context) async {
  //   if (bitmapDescriptorStartLocation == null) {
  //     final ImageConfiguration imagesStartConfiguration =
  //         createLocalImageConfiguration(context);
  //     bitmapDescriptorStartLocation = await BitmapDescriptor.fromAssetImage(
  //       imagesStartConfiguration,
  //       ConstanceData.mylocation1,
  //     );
  //     setState(() {});
  //   }
  // }

  Widget offLineMode() {
    return Animator(
      duration: Duration(milliseconds: 400),
      cycles: 1,
      builder: (anim) => SizeTransition(
        sizeFactor: anim,
        axis: Axis.horizontal,
        child: Container(
          height: AppBar().preferredSize.height + 10.0,
          color: staticGreenColor,
          child: Padding(
            padding: EdgeInsets.only(right: 14, left: 14),
            child: Row(
              children: <Widget>[
                DottedBorder(
                  color: ConstanceData.secoundryFontColor,
                  borderType: BorderType.Circle,
                  strokeWidth: 2,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      FontAwesomeIcons.cloudMoon,
                      color: ConstanceData.secoundryFontColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                     getTranslated(context,'You are offline !'),
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ConstanceData.secoundryFontColor,
                          ),
                    ),
                    Text(
                      getTranslated(context,'Go online to strat accepting jobs.'),
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: ConstanceData.secoundryFontColor,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
