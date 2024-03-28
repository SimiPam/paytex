import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytex/shared/utils/themes/theme.dart';
import 'package:paytex/shared/widgets/custom_button.dart';
import 'package:paytex/shared/widgets/space.dart';

import '../../router/route_paths.dart';
import '../../shared/utils/assets.dart';
import '../../shared/utils/utils.dart';

class SplashScreenThree extends StatefulWidget {
  const SplashScreenThree({super.key});

  @override
  State<SplashScreenThree> createState() => _SplashScreenThreeState();
}

class _SplashScreenThreeState extends State<SplashScreenThree> {
  @override
  void initState() {
    super.initState();
    // startTimer(RoutePaths.signIn);
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
              SvgAssets.logoOnly,
              // color: AppColors.primaryColor,
            ),
            HSpace(60.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Make Banking Simple\n With ",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FWt.bold,
                    color: pmTheme.black,
                    height: 1.6),
                children: <TextSpan>[
                  TextSpan(
                    text: "Paytex",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: pmTheme.primaryColor,
                      fontWeight: FWt.bold,
                    ),
                  ),
                ],
              ),
            ),
            HSpace(12.h),
            Styles.regular(
              'Send money, pay bills, and more with ease',
              fontSize: 14.sp,
              color: pmTheme.subText,
            ),
            HSpace(48.h),
            CustomButton(
              margin: 0.h,
              btnColor: pmTheme.primaryColor,
              width: 233.w,
              height: 55.h,
              fontWeight: FWt.bold,
              txtSize: 16.sp,
              title: 'Get Started',
              onPress: () {
                Navigator.pushReplacementNamed(context, RoutePaths.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
