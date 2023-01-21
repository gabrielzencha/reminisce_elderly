import 'package:Reminisce/pages/Dashboard/DashboardView.dart';
import 'package:Reminisce/pages/auth/screens/user_information_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:Reminisce/helper/helper_function.dart';
import 'package:Reminisce/pages/home_page.dart';
import 'package:Reminisce/pages/onboarding/welcome.dart';
import 'package:Reminisce/router.dart';
import 'package:Reminisce/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  bool _isInfoSaved = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
    getUserInfoStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  getUserInfoStatus() async {
    await HelperFunctions.getUserInfoSavedSF().then((value) {
      if (value != null) {
        setState(() {
          _isInfoSaved = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ((settings) => generateRoute(settings) ) ,
      home: Builder(builder: (BuildContext context) {
       
        
        if (_isSignedIn && _isInfoSaved) {
          return  DashboardView(index: 0, extras: []);
        } else if(_isSignedIn && !_isInfoSaved){
          return UserInformationScreen();
        }
        else {
          return const PolicyScreen();
        }
      }),
    );
  }
}
