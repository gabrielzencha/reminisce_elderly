import 'package:Reminisce/pages/Memories/Memories.dart';
import 'package:Reminisce/pages/Messages/messages.dart';
import 'package:Reminisce/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_to_background/move_to_background.dart';

import '../../helper/helper_function.dart';
import '../../service/auth_services.dart';
import '../../service/database_service.dart';
import '../../shared/constants.dart';
import '../../widgets/widgets.dart';
import '../HomePage/HomeView.dart';
import '../auth/screens/login_page.dart';
import '../profile_page.dart';

class DashboardView extends StatefulWidget {
  final int index;
  final List extras;
  DashboardView({Key? key, required this.index, required this.extras}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentTabIndex = 0;
  int _beforeTabIndex = 0;
  int counterOfBack = 0;
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? groups;
  bool _isLoading = false;
  String groupName = "";
  String profilePhoto = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }


  Future<void> _showQuitAppDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit the app'),
          content: Text("Do you want to exit the app?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                MoveToBackground.moveTaskToBack();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
// string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    await HelperFunctions.getProfilePhotoFromSF().then((val) {
      setState(() {
        profilePhoto = val!;
      });
    });
    // getting the list of snapshots in our stream
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        if (_scaffoldKey.currentState != null) {
          if (_scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.of(context).pop();
            return false;
          }
        }
        if (currentTabIndex != 0 && currentTabIndex != 3) {
          currentTabIndex = 0;
          setState(() {});
          return false;
        } else {
          counterOfBack++;
          if (counterOfBack == 2) {
            counterOfBack = 0;
            await _showQuitAppDialog();
          }

          return false;
        }
      },
      child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            drawer: buildDrawer(context),
            body: getTabs()[currentTabIndex == 3 ? _beforeTabIndex : currentTabIndex],
            bottomNavigationBar: BottomAppBar(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    color: Colors.blueGrey,
                  ),
                  height: 60,
                  child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {
                          setState(() {
                            currentTabIndex = 0;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.home, color: currentTabIndex == 0 ? kLightBlue : kWhite, size: 30),
                            AutoSizeText("Home", style: GoogleFonts.breeSerif(fontStyle: FontStyle.normal, color: currentTabIndex == 0 ? kBlue : kWhite, fontSize: 8.0))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: kLightBlue,
                      width: 2,
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {
                          setState(() {
                            currentTabIndex = 1;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.sensors, color: currentTabIndex == 1 ? kBlue : kWhite, size: 30),
                            AutoSizeText("Messages", style: GoogleFonts.breeSerif(fontStyle: FontStyle.normal, color: currentTabIndex == 1 ? kBlue : kWhite, fontSize: 8.0))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: kBlue,
                      width: 2,
                    ),
                    SizedBox(
                      width: screenWidth * 0.25,
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {
                          setState(() {
                            currentTabIndex = 2;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.notifications,
                              color: currentTabIndex == 2 ? kBlue : kWhite,
                              size: 30,
                            ),
                            AutoSizeText(
                              "Memories",
                              style: GoogleFonts.breeSerif(fontStyle: FontStyle.normal, color: currentTabIndex == 2 ? kBlue : kWhite, fontSize: 8.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: kBlue,
                      width: 2,
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {
                          if (currentTabIndex != 3) {
                            _beforeTabIndex = currentTabIndex;
                          }

                          currentTabIndex = 3;

                          ///setState(() {});
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.menu, color: currentTabIndex == 3 ? kBlue : kWhite, size: 30),
                            AutoSizeText("Settings", style: GoogleFonts.breeSerif(fontStyle: FontStyle.normal, color: currentTabIndex == 3 ? kBlue : kWhite, fontSize: 8.0))
                          ],
                        ),
                      ),
                    ),
                  ]),
                )),
          )),
    );
    //Size size = MediaQuery.of(context).size;
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            profilePhoto=="" ?
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ):
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.network(profilePhoto, fit: BoxFit.fitHeight),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              userName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: () {},
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.group),
              title: const Text(
                "Groups",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                nextScreenReplace(
                    context,
                    ProfilePage(
                      userName: userName,
                      email: email,
                      profilePic: profilePhoto
                    ));
              },
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.group),
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                      (route) => false);
                            },
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    });
              },
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        )
    );
  }
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    padding: EdgeInsets.all(4.0),
  );
  List<Widget> getTabs() {
    List<Widget> tabs = [
      HomePage(),
      HomePage(),
      HomePage()
    ];
    return tabs;
  }

}