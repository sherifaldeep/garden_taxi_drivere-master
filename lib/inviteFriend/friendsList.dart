import 'package:flutter/material.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
import 'package:my_cab_driver/utilites/helpers.dart';

class FriendsList extends StatefulWidget {
  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBar(),
      body: Column(
        children: <Widget>[
          textBox(),
          Divider(
            thickness: 1.3,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user3,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getTranslated(context,'Esther Berry'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                            getTranslated(context,'5 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getTranslated(context,'Nellie Scott'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                            getTranslated(context,'5 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.radio_button_unchecked,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user6,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                           getTranslated(context,'Rhoda Palmer'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                           getTranslated(context,'5 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.radio_button_unchecked,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user8,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                           getTranslated(context,'Shane Morales'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                            getTranslated(context,'5 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user4,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getTranslated(context,'Sophie Bell'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                           getTranslated(context,'2 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user9,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getTranslated(context,'Chester Jennings'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                            getTranslated(context,'7 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.radio_button_unchecked,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user7,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                           getTranslated(context,'Trevor Salazar'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                           getTranslated(context,'10 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getTranslated(context,'Nellie Scott'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                            getTranslated(context,'5 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.radio_button_unchecked,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 14, top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            ConstanceData.user4,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getTranslated(context,'Sophie Bell'),
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.title.color,
                                ),
                          ),
                          Text(
                            getTranslated(context,'2 mutual friends'),
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.check_circle,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  indent: 80,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  Widget textBox() {
    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 14),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Theme.of(context).dividerColor),
          color: Theme.of(context).backgroundColor,
        ),
        child: TextFormField(
          autofocus: false,
          style: Theme.of(context).textTheme.body1.copyWith(
                color: Theme.of(context).textTheme.title.color,
              ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: getTranslated(context,'Search'),
            suffixIcon: Icon(
              Icons.mic,
              color: Theme.of(context).disabledColor,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).disabledColor,
            ),
            hintStyle: Theme.of(context).textTheme.body1.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).textTheme.title.color,
              ),
            ),
          ),
          Text(
           getTranslated(context,'Invite Friends'),
            style: Theme.of(context).textTheme.title.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.title.color,
                ),
          ),
          Text(
           getTranslated(context,'Next'),
            style: Theme.of(context).textTheme.subhead.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
