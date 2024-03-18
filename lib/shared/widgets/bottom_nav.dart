// ignore_for_file: dead_code

import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytex/shared/utils/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/base/bottom_nav_model.dart';
import '../utils/color.dart';
import '../utils/utils.dart';

class BottomNav extends StatefulWidget {
  final bool? showProviderProfile;

  const BottomNav({Key? key, this.showProviderProfile}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        _fetchData(context);
        break;
      default:
        break;
    }
  }

  _fetchData(BuildContext context) {
    String? id;
    SharedPreferences? prefs;
    final key = prefs?.getString('dataOwnerId');
    if (key != null) id = json.decode(key);
    // FirebaseMessaging.instance.getToken().then((token) {
    //   _signOut(context, deviceId: token!, dataownerId: id!);
    // });
  }

  // _signOut(BuildContext context,
  //     {required String deviceId, required String dataownerId}) async {
  //   await si.profileService!.signOut(deviceId, dataownerId, context: context);
  //
  //   await si.storageService.removeItem('token');
  //
  //   si.storeService.reset();
  // }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Styles.regular('Exit App',
                fontSize: 14.sp, color: pmTheme.text),
            content: Styles.regular('Do you want to exit an App?',
                fontSize: 14.sp, color: pmTheme.text),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child:
                    Styles.regular('No', fontSize: 14.sp, color: pmTheme.text),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child:
                    Styles.regular('Yes', fontSize: 14.sp, color: pmTheme.text),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(builder: (context, model, child) {
      return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          backgroundColor: primaryWhiteColor,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => model.updateIndex(index, context),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: primaryColor,
              selectedLabelStyle: TextStyle(
                  color: primaryColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(
                  color: pmTheme.text,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
              backgroundColor: primaryWhiteColor,
              currentIndex: model.currentIndex,
              items: userBottomTabItems(context)),
          body: SafeArea(
              child: SizedBox(
                  height: deviceHeight(context).h,
                  width: deviceWidth(context).w,
                  child: model.children[model.currentIndex])),
        ),
      );
    });
  }

  userBottomTabItems(BuildContext context) {
    return [
      // BottomNavigationBarItem(
      //   activeIcon: SvgPicture.asset(
      //     SvgAssets.dashboardIcon,
      //     color: AppColors.primaryColor,
      //   ),
      //   icon: SvgPicture.asset(
      //     SvgAssets.dashboardIcon,
      //     color: AppColors.primaryBgColor,
      //   ),
      //   label: "Dashboard",
      // ),
      // BottomNavigationBarItem(
      //   activeIcon: SvgPicture.asset(
      //     SvgAssets.accountIcon,
      //     color: AppColors.primaryColor,
      //   ),
      //   icon: SvgPicture.asset(
      //     SvgAssets.accountIcon,
      //     color: AppColors.primaryBgColor,
      //   ),
      //   label: "Accounts",
      // ),
      // BottomNavigationBarItem(
      //   activeIcon: SvgPicture.asset(
      //     SvgAssets.consentIcon,
      //     color: AppColors.primaryColor,
      //   ),
      //   icon: SvgPicture.asset(
      //     SvgAssets.consentIcon,
      //     color: AppColors.primaryBgColor,
      //   ),
      //   label: "Consent",
      // ),
      // BottomNavigationBarItem(
      //   activeIcon: SvgPicture.asset(
      //     SvgAssets.profileIcon,
      //     color: AppColors.primaryColor,
      //   ),
      //   icon: SvgPicture.asset(
      //     SvgAssets.profileIcon,
      //     color: AppColors.primaryBgColor,
      //   ),
      //   label: "Me",
      // ),
    ];
  }
}
