import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/auth/loginScreen.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/constance/constance.dart';
import 'package:my_cab_driver/home/images_license.dart';
import 'package:my_cab_driver/home/inside_outside.dart';
import 'package:my_cab_driver/models/driver_info.dart';
import 'package:my_cab_driver/providers/driver_info_provider.dart';
import 'package:my_cab_driver/setting/settingScreen.dart';
import 'package:my_cab_driver/splashScreen.dart';
import 'package:my_cab_driver/introduction/addVehicalScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Language/appLocalizations.dart';
import 'appTheme.dart';
import 'auth/signUpScreen.dart';
import 'constance/constance.dart';
import 'history/historyScreen.dart';
import 'home/homeScreen.dart';
import 'introduction/LocationScreen.dart';
import 'introduction/introductionScreen.dart';
import 'introduction/language_screen.dart';
import 'inviteFriend/inviteFriendScreen.dart';
import 'package:my_cab_driver/wallet/myWallet.dart';
import 'constance/constance.dart' as constance;

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then((_) => runApp(new MyApp()));
// }

//void main() => runApp(DevicePreview(builder: (context) => MyApp()));
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setCustomeTheme(index);
  }

  static setCustomeLanguage(BuildContext context, String languageCode) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLanguage(languageCode);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {
      setState(() {
        constance.colorsIndex = index;
        constance.primaryColorString =
        ConstanceData().colors[constance.colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  String locale = "en";

  setLanguage(String languageCode) {
    setState(() {
      locale = languageCode;
      constance.locale = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    constance.locale = locale;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.black12,
        systemNavigationBarColor: Colors.black,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DriverInfoProvider(),
        ),
      ],
      child: MaterialApp(
        // builder: DevicePreview.appBuilder,

        title: 'MyCab Driver',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        routes: routes,
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,

        ],
        supportedLocales: [
          Locale('en',''),
          Locale('ar',''),
        ],
        localeResolutionCallback: (currentLocale , supportedLocales){
          if(currentLocale!=null){
            print(currentLocale.languageCode);
            for(Locale locale in supportedLocales){
              if(currentLocale.languageCode == locale.languageCode){
                return currentLocale;
              }
            }
          }
          return supportedLocales.first;
        },
       // home: LicenceImage(),
      ),
    );
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.INTRODUCTION: (BuildContext context) => new IntroductionScreen(),
    Routes.ENABLELOCATION: (BuildContext context) => new EnableLocation(),
    Routes.AUTH: (BuildContext context) => new SignUpScreen(),
    Routes.HOME: (BuildContext context) => new HomeScreen(),
    Routes.HISTORY: (BuildContext context) => new HistoryScreen(),
    //Routes.NOTIFICATION: (BuildContext context) => new NotificationScreen(),
    Routes.INVITE: (BuildContext context) => new InviteFriendScreen(),
    Routes.SETTING: (BuildContext context) => new SettingScreen(),
    Routes.WALLET: (BuildContext context) => new MyWallet(),
    Routes.LOGIN: (BuildContext context) => new LoginScreen(),
    Routes.Languages: (context) => LanguageScreen(),
    Routes.AddVehicle: (context) => AddNewVehical(),
    Routes.SelectDstrict: (context) => InsideAndOutSide(),
    Routes.Licenses: (context) => LicenceImage(),
  };
}

class Routes {
  static const String SPLASH = "/";
  static const String INTRODUCTION = "/introduction/introductionScreen";
  static const String ENABLELOCATION = "/introduction/LocationScreen";
  static const String AUTH = "/auth/signUpScreen";
  static const String LOGIN = "/auth/loginScreen";
  static const String HOME = "/home/homeScreen";
  static const String HISTORY = "/history/historyScreen";
  static const String NOTIFICATION = "/notification/notificationScree";
  static const String INVITE = "/inviteFriend/inviteFriendScreen";
  static const String SETTING = "/setting/settingScreen";
  static const String WALLET = "/wallet/myWallet";
  static const String Languages = "languages";
  static const String AddVehicle = "addVehicle";
  static const String SelectDstrict = "selectDistrict";
  static const String Licenses = "licenses";
}