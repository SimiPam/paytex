// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';
import '../utils/utils.dart';

class CustomButton extends StatefulWidget {
  final Widget? icon;
  final String title;
  final VoidCallback onPress;
  final Color? txtColor;
  final double? width;
  final double? height;
  final bool hasElevation;
  final double? txtSize;
  final bool isActive;
  final Color? btnColor;
  final Color? nonActiveBtnColor;
  final FontWeight? fontWeight;
  final double margin;
  final bool? trackBtnChild;
  final Widget? btnChild;
  final bool? warningBtn;

  const CustomButton({
    Key? key,
    this.icon,
    this.warningBtn,
    required this.margin,
    required this.title,
    this.nonActiveBtnColor,
    required this.onPress,
    this.txtColor = primaryWhiteColor,
    this.fontWeight,
    this.txtSize,
    this.width,
    this.btnColor = primaryColor,
    this.height,
    this.isActive = true,
    this.hasElevation = false,
    this.btnChild,
    this.trackBtnChild,
  }) : super(key: key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color:
              widget.warningBtn == true ? textErrorRedColor : widget.txtColor!,
          width: 0.8,
        ),
        color: widget.isActive == true
            ? widget.btnColor
            : widget.nonActiveBtnColor,
      ),
      width: widget.width ?? deviceWidth(context).w,
      height: widget.height ?? 55.h,
      child: TextButton(
        onPressed: widget.onPress,
        // onPressed: widget.isActive ? widget.onPress : () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: BorderSide(color: widget.btnColor!)),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
            backgroundColor:
                MaterialStateProperty.all<Color>(widget.btnColor!)),
        child: widget.trackBtnChild == true
            ? widget.btnChild!
            : Styles.semiBold(
                widget.title,
                color: widget.txtColor ?? primaryWhiteColor,
                fontSize: widget.txtSize ?? 16.sp,
              ),
      ),
    );
  }
}
