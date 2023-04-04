import 'package:best_flutter_ui_templates/model/aboutus_page.dart';
import 'package:best_flutter_ui_templates/model/drawer_user_controller.dart';
import 'package:best_flutter_ui_templates/model/home_drawer.dart';
import 'package:best_flutter_ui_templates/model/feedback_screen.dart';
import 'package:best_flutter_ui_templates/model/help_screen.dart';
import 'package:best_flutter_ui_templates/model/home_screen.dart';
import 'package:best_flutter_ui_templates/model/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/model/rating_page.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 248, 236, 228),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 248, 236, 228),
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const MyHomePage();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        case DrawerIndex.Share:
          setState(() {
            screenView = RateUsPage();
          });
          break;
        case DrawerIndex.About:
          setState(() {
            screenView = AboutUsPage();
          });
          break;
        default:
          break;
      }
    }
  }
}
