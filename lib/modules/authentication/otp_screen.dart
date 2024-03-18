import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/service-injector/service_injector.dart';
import '../../router/route_paths.dart';
import '../../shared/utils/color.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/space.dart';
import 'viewmodel/authentication_vm.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      vmBuilder: (context) => AuthViewModel(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, AuthViewModel viewModel) =>
      Scaffold(
        key: viewModel.scaffoldKey,
        backgroundColor: primaryWhiteColor,
        body: Container(
          height: deviceHeight(context),
          width: deviceWidth(context),
          padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 57.h),
          child: Form(
            key: viewModel.signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Platform.isAndroid
                    ? InkWell(
                        onTap: () => Navigator.pop(context),
                        child: FaIcon(
                          FontAwesomeIcons.arrowLeftLong,
                          size: 28.sp,
                          color: textGrayScaleBlueColor,
                          // size: .sp,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 28.sp,
                          color: textGrayScaleBlueColor,
                        ),
                      ),
                HSpace(20.h),
                Styles.medium("Enter verification code",
                    fontSize: 20.sp, color: textGrayScaleBlueColor),
                HSpace(8.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "We sent a code to ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FWt.regular,
                      color: textGrayScaleBlueColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${si.email}\n",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: textGrayScaleBlueColor,
                          fontWeight: FWt.regular,
                        ),
                      )
                    ],
                  ),
                ),
                HSpace(24.h),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.start,
                  autoDisposeControllers: false,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  cursorColor: primaryColor,
                  focusNode: FocusNode(),
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 44.h,
                      fieldWidth: 44.w,
                      fieldOuterPadding: EdgeInsets.only(right: 12.w),
                      inactiveFillColor: primaryWhiteColor,
                      activeColor: primaryColor,
                      inactiveColor: underlineGrayColor,
                      selectedFillColor: primaryWhiteColor,
                      selectedColor: primaryColor,
                      errorBorderColor: textErrorRedColor,
                      disabledColor: underlineGrayColor,
                      activeFillColor: primaryWhiteColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  errorAnimationController: viewModel.errorController,
                  controller: viewModel.otpController,
                  onCompleted: (v) async {
                    // print("Completed");
                    var data = {
                      "code": viewModel.otpController.text,
                      "userName": si.email
                    };

                    Navigator.pushNamed(context, RoutePaths.resetPassword);
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    // print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                HSpace(40.h),
                Center(
                  child: Styles.semiBold('Resend code',
                      fontSize: 14.sp, color: textGrayScaleBlueColor),
                )
              ],
            ),
          ),
        ),
      );
}
