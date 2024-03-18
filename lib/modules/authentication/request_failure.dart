import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/authentication/widgets/constants.dart';
import '../../shared/utils/color.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/custom_snackbar.dart';
import '../../shared/widgets/space.dart';

class AuthenticationFailure extends StatelessWidget {
  final String? authMessage;
  const AuthenticationFailure({Key? key, this.authMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhiteColor,
      appBar: buildPreferredSize(context: context),
      body: SizedBox(
          width: deviceWidth(context).h,
          height: deviceHeight(context).w,
          child: Stack(
            children: [
              // Positioned(
              //   top: -30.h,
              //   right: 1.w,
              //   child: Image.asset(
              //     ImageAssets.authIconImg,
              //     width: deviceWidth(context) / 2.7.w,
              //     height: deviceHeight(context) / 3.h,
              //   ),
              // ),
              SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 24.h,
                        //   child: InkWell(
                        //     onTap: () => Navigator.pop(context),
                        //     child: SizedBox(
                        //         width: 15.w,
                        //         height: 40.h,
                        //         child: const Icon(Icons.arrow_back_ios)),
                        //   ),
                        // ),
                        // HSpace(16.h),
                        HSpace(66.h),
                        // Image.asset(
                        //   ImageAssets.unlockIcon,
                        //   width: 56.w,
                        //   height: 56.h,
                        // ),
                        HSpace(26.h),
                        Styles.regular("Authentication Failure 🥲",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: textErrorRedColor,
                            height: 1.4),
                        HSpace(8.h),
                        Styles.regular(authMessage ?? "We will be back shortly",
                            fontSize: 14.sp, color: textGrayScaleBlueColor),
                        HSpace(53.h),
                        Styles.regular("Contact Cdal",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: textGrayScaleBlueColor),
                        HSpace(36.h),
                        Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: primaryWhiteColor,
                            border: Border.all(color: textGrayScalePurpleColor),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Styles.regular("support@cdal.com",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: textBodyPurpleColor)),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: "support@cdal.com"))
                                      .then((_) {
                                    snackBar(
                                        context: context,
                                        message:
                                            'Email Address copied to clipboard',
                                        isError: false);
                                    // successSnackBar(message: "Email Address copied to clipboard", context: context!);
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.copy,
                                      color: primaryLightGrayBGColor,
                                      size: 20.sp,
                                    ),
                                    HSpace(5.w),
                                    Styles.regular("Copy",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: primaryColor)
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        HSpace(16.h),
                        Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: primaryWhiteColor,
                            border: Border.all(color: primaryWhiteBGColor),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Styles.regular("+** *** *** 0000",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: textGrayScaleBlueColor)),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: "+** *** *** 0000"))
                                      .then((_) {
                                    snackBar(
                                        context: context,
                                        message:
                                            'Phone number copied to clipboard',
                                        isError: false);
                                    // successSnackBar(message: "Phone number copied to clipboard", context: context!);
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.copy,
                                      color: primaryLightGrayBGColor,
                                      size: 20.sp,
                                    ),
                                    HSpace(5.w),
                                    Styles.regular("Copy",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: primaryColor)
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
