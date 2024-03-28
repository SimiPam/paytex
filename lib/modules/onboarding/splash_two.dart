import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytex/shared/utils/themes/theme.dart';

import '../../router/route_paths.dart';
import '../../shared/utils/assets.dart';
import '../../shared/utils/utils.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    startTimer(RoutePaths.splashThree);
  }

  startTimer(routeName) {
    const duration = Duration(seconds: 6);
    return Timer(duration, () {
      route(routeName);
    });
  }

  route(routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pmTheme.white,
      body: SizedBox(
        height: logicalHeight(),
        width: logicalWidth(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgAssets.coloredLogo,
              // color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
