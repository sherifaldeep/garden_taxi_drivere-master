import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/ticketView.dart';
import 'package:my_cab_driver/utilites/helpers.dart';
import '../appTheme.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';

class PickupScreen extends StatefulWidget {
  @override
  _PickupScreenState createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    seticonimage(context);
    seticonimage2(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColors,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
            ),
            Text(
              getTranslated(context,'Pick up'),
              style:
                  headLineStyle.copyWith(fontSize: 20.0, color: Colors.black),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            compassEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(51.505923, -0.086936),
              zoom: 20,
              bearing: 4,
              tilt: 6,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              //setLDMapStyle();
            },
            markers: Set<Marker>.of(getMarkerList(context).values),
            polylines: Set<Polyline>.of(getPolyLine(context).values),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.15,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.isLightTheme
                          ? Colors.black.withOpacity(0.2)
                          : Colors.white.withOpacity(0.2),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150, left: 150),
                      child: Container(
                        height: 2.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: staticGreenColor,
                            radius: 22,
                            child: Text(
                              "A",
                              style: headLineStyle.copyWith(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                getTranslated(context,'Pick up at'),
                                style: describtionStyle.copyWith(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                getTranslated(context,'London Bridge Walk'),
                                style: headLineStyle.copyWith(fontSize: 20.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 14, left: 14, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'EST',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                getTranslated(context,'0 min'),
                                style: describtionStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                getTranslated(context,'Distance'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '00.00 km',
                                style: describtionStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                getTranslated(context,'Fare'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'LE 00.00',
                                style: describtionStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TicketDesign(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: staticGreenColor,
                          ),
                          child: Center(
                            child: Text(
                              getTranslated(context,'DROP OFF'),
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ConstanceData.secoundryFontColor,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_upward,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            getTranslated(context,'Head southwest on Madison St'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46, top: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            getTranslated(context,'18 miles'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 50,
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.subdirectory_arrow_left,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            getTranslated(context,'Turn left onto 4th Ave'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46, top: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            getTranslated(context,'12 miles'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 50,
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.subdirectory_arrow_right,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            getTranslated(context,'Turn Right at 105th'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46, top: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            getTranslated(context,'40 miles'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 50,
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.subdirectory_arrow_right,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            getTranslated(context,'Turn Right at William St'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46, top: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                           getTranslated(context,'40 miles'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 50,
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_upward,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            getTranslated(context,'Continue straight stay'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46, top: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            getTranslated(context,'24 miles'),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              width: 50,
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 16,
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            children: <Widget>[
              Container(
                height: AppBar().preferredSize.height,
                color: staticGreenColor,
                child: Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.assistant_photo,
                        color: ConstanceData.secoundryFontColor,
                      ),
                      Text(
                        '250m',
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ConstanceData.secoundryFontColor,
                            ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          getTranslated(context,
                              'Turn right at 105 William St,Chicago, US'),
                          style: describtionStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
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
    );
  }

  Map<PolylineId, Polyline> getPolyLine(BuildContext context) {
    Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
    List<LatLng> latlng1 = [
      LatLng(51.505923, -0.086936),
      LatLng(51.506061, -0.087631),
      LatLng(51.506171, -0.088258),
      LatLng(51.507129, -0.087974),
      LatLng(51.509693, -0.087075),
      LatLng(51.509065, -0.082206),
      LatLng(51.509119, -0.081204)
    ];
    final PolylineId polylineId = PolylineId('polylineId');
    final Polyline polyline = Polyline(
      polylineId: polylineId,
      color: Theme.of(context).primaryColor,
      consumeTapEvents: false,
      points: latlng1,
      width: 4,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    );
    _polylines.addAll({polylineId: polyline});
    return _polylines;
  }

  BitmapDescriptor bitmapDescriptorStartLocation;
  BitmapDescriptor bitmapDescriptorStartLocation2;

  var lat2 = 51.505923;
  var long2 = -0.086936;

  var lat3 = 51.509119;
  var long3 = -0.081204;

  Map<MarkerId, Marker> getMarkerList(BuildContext context) {
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
    final MarkerId markerId2 = MarkerId("markerId2");
    final MarkerId markerId3 = MarkerId("markerId3");

    final Marker marker2 = Marker(
      markerId: markerId2,
      position: LatLng(lat2, long2),
      anchor: Offset(0.5, 0.5),
      icon: bitmapDescriptorStartLocation2,
    );

    final Marker marker3 = Marker(
      markerId: markerId3,
      position: LatLng(lat3, long3),
      anchor: Offset(0.5, 0.5),
      icon: bitmapDescriptorStartLocation,
    );
    markers.addAll({markerId2: marker2});
    markers.addAll({markerId3: marker3});

    return markers;
  }

  Future seticonimage2(BuildContext context) async {
    if (bitmapDescriptorStartLocation2 == null) {
      final ImageConfiguration imagesStartConfiguration =
          createLocalImageConfiguration(context);
      bitmapDescriptorStartLocation2 = await BitmapDescriptor.fromAssetImage(
        imagesStartConfiguration,
        ConstanceData.mylocation1,
      );
      setState(() {});
    }
  }

  Future seticonimage(BuildContext context) async {
    if (bitmapDescriptorStartLocation == null) {
      final ImageConfiguration imagesStartConfiguration =
          createLocalImageConfiguration(context);
      bitmapDescriptorStartLocation = await BitmapDescriptor.fromAssetImage(
        imagesStartConfiguration,
        ConstanceData.mylocation3,
      );
      setState(() {});
    }
  }

  void setLDMapStyle() async {
    if (mapController != null) {
      if (AppTheme.isLightTheme) {
        mapController.setMapStyle(await DefaultAssetBundle.of(context)
            .loadString("jsonFile/lightmapstyle.json"));
      } else {
        mapController.setMapStyle(await DefaultAssetBundle.of(context)
            .loadString("jsonFile/darkmapstyle.json"));
      }
    }
  }
}
