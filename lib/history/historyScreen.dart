import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/drawer/drawer.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
import 'package:my_cab_driver/utilites/helpers.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75 < 400
            ? MediaQuery.of(context).size.width * 0.75
            : 350,
        child: Drawer(
          child: AppDrawer(
            selectItemName: 'History',
          ),
        ),
      ),
      appBar: appBar(),
      body: Column(
        children: <Widget>[
          Container(
            height: 1.5,
            color: Colors.black12,
          ),
          jobsAndEarns(),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(16),
                        color: Colors.blue,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(16),
                                  topStart: Radius.circular(16)),
                              color: Colors.black12,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      "assets/profile_icon.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                       getTranslated(context,'Esther Berry'),
                                        style: headLineStyle.copyWith(
                                          fontSize: 18.0,
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
                                                style:
                                                    describtionStyle.copyWith(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                              color: Colors.white,
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
                                                  getTranslated(context,
                                                      'Discount'),
                                                  style:
                                                      describtionStyle.copyWith(
                                                          color: Colors.blue)),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                              color: Colors.white,
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
                                        style: buttonsText,
                                      ),
                                      Text(
                                        '00.00km',
                                        style: buttonsText.copyWith(
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 14, left: 14, bottom: 8, top: 8),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(getTranslated(context,'PICKUP'),
                                        style: describtionStyle.copyWith(
                                          color: Colors.white,
                                        )),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "حدايق الأهرام بوبة خوفو الهضبة",
                                      style: describtionStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 14, left: 14),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 14, left: 14, bottom: 8, top: 8),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                     getTranslated(context,'DROP OFF'),
                                      style: describtionStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "ميدان الرماية شارع الهرم",
                                      style: describtionStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 6, left: 6),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadiusDirectional.circular(16),
                  //       color: Theme.of(context).cardColor,
                  //     ),
                  //     child: Column(
                  //       children: <Widget>[
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadiusDirectional.only(
                  //                 topEnd: Radius.circular(16),
                  //                 topStart: Radius.circular(16)),
                  //             color: Theme.of(context).dividerColor,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(14),
                  //             child: Row(
                  //               children: <Widget>[
                  //                 ClipRRect(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   child: Image.asset(
                  //                     ConstanceData.user1,
                  //                     height: 50,
                  //                     width: 50,
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 8,
                  //                 ),
                  //                 Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Text(
                  //                       AppLocalizations.of('Callie Greer'),
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .title
                  //                           .copyWith(
                  //                             fontWeight: FontWeight.bold,
                  //                             color: Theme.of(context)
                  //                                 .textTheme
                  //                                 .title
                  //                                 .color,
                  //                           ),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 4,
                  //                     ),
                  //                     Row(
                  //                       children: <Widget>[
                  //                         Container(
                  //                           height: 24,
                  //                           width: 74,
                  //                           child: Center(
                  //                             child: Text(
                  //                               AppLocalizations.of('ApplePay'),
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .button
                  //                                   .copyWith(
                  //                                     fontWeight:
                  //                                         FontWeight.bold,
                  //                                     color: ConstanceData
                  //                                         .secoundryFontColor,
                  //                                   ),
                  //                             ),
                  //                           ),
                  //                           decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.all(
                  //                               Radius.circular(15),
                  //                             ),
                  //                             color: Theme.of(context)
                  //                                 .primaryColor,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 4,
                  //                         ),
                  //                         Container(
                  //                           height: 24,
                  //                           width: 74,
                  //                           child: Center(
                  //                             child: Text(
                  //                               AppLocalizations.of('Discount'),
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .button
                  //                                   .copyWith(
                  //                                     fontWeight:
                  //                                         FontWeight.bold,
                  //                                     color: ConstanceData
                  //                                         .secoundryFontColor,
                  //                                   ),
                  //                             ),
                  //                           ),
                  //                           decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.all(
                  //                               Radius.circular(15),
                  //                             ),
                  //                             color: Theme.of(context)
                  //                                 .primaryColor,
                  //                           ),
                  //                         )
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //                 Expanded(
                  //                   child: SizedBox(),
                  //                 ),
                  //                 Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.end,
                  //                   children: <Widget>[
                  //                     Text(
                  //                       '\$20.00',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .title
                  //                           .copyWith(
                  //                             fontWeight: FontWeight.bold,
                  //                             color: Theme.of(context)
                  //                                 .textTheme
                  //                                 .title
                  //                                 .color,
                  //                           ),
                  //                     ),
                  //                     Text(
                  //                       '1.5 km',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .caption
                  //                           .copyWith(
                  //                             color: Theme.of(context)
                  //                                 .disabledColor,
                  //                             fontWeight: FontWeight.bold,
                  //                           ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           height: 1,
                  //           width: MediaQuery.of(context).size.width,
                  //           color: Theme.of(context).dividerColor,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               right: 14, left: 14, bottom: 8, top: 8),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Text(
                  //                     AppLocalizations.of('PICKUP'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .caption
                  //                         .copyWith(
                  //                           color:
                  //                               Theme.of(context).disabledColor,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 4,
                  //                   ),
                  //                   Text(
                  //                     AppLocalizations.of('62 Kobe Trafficway'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .subtitle
                  //                         .copyWith(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Theme.of(context)
                  //                               .textTheme
                  //                               .title
                  //                               .color,
                  //                         ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 14, left: 14),
                  //           child: Container(
                  //             height: 1,
                  //             width: MediaQuery.of(context).size.width,
                  //             color: Theme.of(context).dividerColor,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               right: 14, left: 14, bottom: 8, top: 8),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Text(
                  //                     AppLocalizations.of('DROP OFF'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .caption
                  //                         .copyWith(
                  //                           color:
                  //                               Theme.of(context).disabledColor,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 4,
                  //                   ),
                  //                   Text(
                  //                     AppLocalizations.of(
                  //                         '280, AB Sunny willa'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .subtitle
                  //                         .copyWith(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Theme.of(context)
                  //                               .textTheme
                  //                               .title
                  //                               .color,
                  //                         ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 6, left: 6),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadiusDirectional.circular(16),
                  //       color: Theme.of(context).cardColor,
                  //     ),
                  //     child: Column(
                  //       children: <Widget>[
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadiusDirectional.only(
                  //                 topEnd: Radius.circular(16),
                  //                 topStart: Radius.circular(16)),
                  //             color: Theme.of(context).dividerColor,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(14),
                  //             child: Row(
                  //               children: <Widget>[
                  //                 ClipRRect(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   child: Image.asset(
                  //                     ConstanceData.user2,
                  //                     height: 50,
                  //                     width: 50,
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 8,
                  //                 ),
                  //                 Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Text(
                  //                       AppLocalizations.of('Esther Berry'),
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .title
                  //                           .copyWith(
                  //                             fontWeight: FontWeight.bold,
                  //                             color: Theme.of(context)
                  //                                 .textTheme
                  //                                 .title
                  //                                 .color,
                  //                           ),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 4,
                  //                     ),
                  //                     Row(
                  //                       children: <Widget>[
                  //                         Container(
                  //                           height: 24,
                  //                           width: 74,
                  //                           child: Center(
                  //                             child: Text(
                  //                               AppLocalizations.of('ApplePay'),
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .button
                  //                                   .copyWith(
                  //                                     fontWeight:
                  //                                         FontWeight.bold,
                  //                                     color: ConstanceData
                  //                                         .secoundryFontColor,
                  //                                   ),
                  //                             ),
                  //                           ),
                  //                           decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.all(
                  //                               Radius.circular(15),
                  //                             ),
                  //                             color: Theme.of(context)
                  //                                 .primaryColor,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 4,
                  //                         ),
                  //                         Container(
                  //                           height: 24,
                  //                           width: 74,
                  //                           child: Center(
                  //                             child: Text(
                  //                               AppLocalizations.of('Discount'),
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .button
                  //                                   .copyWith(
                  //                                     fontWeight:
                  //                                         FontWeight.bold,
                  //                                     color: ConstanceData
                  //                                         .secoundryFontColor,
                  //                                   ),
                  //                             ),
                  //                           ),
                  //                           decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.all(
                  //                               Radius.circular(15),
                  //                             ),
                  //                             color: Theme.of(context)
                  //                                 .primaryColor,
                  //                           ),
                  //                         )
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //                 Expanded(
                  //                   child: SizedBox(),
                  //                 ),
                  //                 Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.end,
                  //                   children: <Widget>[
                  //                     Text(
                  //                       '\$10.00',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .title
                  //                           .copyWith(
                  //                             fontWeight: FontWeight.bold,
                  //                             color: Theme.of(context)
                  //                                 .textTheme
                  //                                 .title
                  //                                 .color,
                  //                           ),
                  //                     ),
                  //                     Text(
                  //                       '0.5 km',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .caption
                  //                           .copyWith(
                  //                             color: Theme.of(context)
                  //                                 .disabledColor,
                  //                             fontWeight: FontWeight.bold,
                  //                           ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           height: 1,
                  //           width: MediaQuery.of(context).size.width,
                  //           color: Theme.of(context).dividerColor,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               right: 14, left: 14, bottom: 8, top: 8),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Text(
                  //                     AppLocalizations.of('PICKUP'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .caption
                  //                         .copyWith(
                  //                           color:
                  //                               Theme.of(context).disabledColor,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 4,
                  //                   ),
                  //                   Text(
                  //                     AppLocalizations.of(
                  //                         '25 Lcie Park Suite 456'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .subtitle
                  //                         .copyWith(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Theme.of(context)
                  //                               .textTheme
                  //                               .title
                  //                               .color,
                  //                         ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 14, left: 14),
                  //           child: Container(
                  //             height: 1,
                  //             width: MediaQuery.of(context).size.width,
                  //             color: Theme.of(context).dividerColor,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               right: 14, left: 14, bottom: 8, top: 8),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Text(
                  //                     AppLocalizations.of('DROP OFF'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .caption
                  //                         .copyWith(
                  //                           color:
                  //                               Theme.of(context).disabledColor,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 4,
                  //                   ),
                  //                   Text(
                  //                     AppLocalizations.of(
                  //                         '187/ William St, London, UK'),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .subtitle
                  //                         .copyWith(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Theme.of(context)
                  //                               .textTheme
                  //                               .title
                  //                               .color,
                  //                         ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 16,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget jobsAndEarns() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: staticGreenColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.carAlt,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          getTranslated(context,'Total Job'),
                          style: buttonsText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '0',
                          style: describtionStyle.copyWith(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: staticGreenColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 38,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                         getTranslated(context,'Earned'),
                          style: describtionStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('00.00 LE',
                            style: describtionStyle.copyWith(
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: AppBar().preferredSize.height,
            //width: AppBar().preferredSize.height + 40,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 5.0),
                      ],
                    ),
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
            ),
          ),
          SizedBox(width: 10.0),
          Text(
           getTranslated(context,'History'),
            style: headLineStyle.copyWith(color: Colors.black, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppBar().preferredSize.height,
            //width: AppBar().preferredSize.height + 40,
          ),
        ],
      ),
      actions: [
        Image.asset("assets/images/setting_effect.PNG"),
      ],
    );
  }

  // Widget celanderList() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 8, bottom: 8),
  //     color: Theme.of(context).scaffoldBackgroundColor,
  //     height: 80,
  //     // child: ListView(
  //     //   scrollDirection: Axis.horizontal,
  //     //   children: <Widget>[
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Sun'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '1',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).scaffoldBackgroundColor,
  //     //         border:
  //     //             Border.all(color: Theme.of(context).primaryColor, width: 1),
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Mon'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).primaryColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '2',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).primaryColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Tue'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '3',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Wed'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '4',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Thu'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '5',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Fri'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '6',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Sat'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '7',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //     SizedBox(
  //     //       width: 8,
  //     //     ),
  //     //     Container(
  //     //       decoration: BoxDecoration(
  //     //         borderRadius: BorderRadius.circular(16),
  //     //         color: Theme.of(context).backgroundColor,
  //     //       ),
  //     //       child: Padding(
  //     //         padding: const EdgeInsets.all(8.0),
  //     //         child: Column(
  //     //           children: <Widget>[
  //     //             Text(
  //     //               AppLocalizations.of('Sun'),
  //     //               style: Theme.of(context).textTheme.button.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //             Expanded(
  //     //               child: SizedBox(),
  //     //             ),
  //     //             Text(
  //     //               '8',
  //     //               style: Theme.of(context).textTheme.title.copyWith(
  //     //                     fontWeight: FontWeight.bold,
  //     //                     color: Theme.of(context).disabledColor,
  //     //                   ),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       width: 50,
  //     //     ),
  //     //   ],
  //     // ),
  //   );
  // }
}
