// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';
import '../utils/themes/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? obscureText;
  String? hintText;
  final Widget? icon;
  String? label;
  Color? labelColor;
  final String? Function(String?)? validator;
  final void Function(String)? onSaved;
  Function()? onTap;
  Color? fillingColor;
  bool autofocus;
  bool isEnabled;
  TextInputType? keyboardType;
  int? maxLines;
  TextInputType? textInputType;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  String? labelText;
  bool? filled;
  bool? useUnderline;
  AutovalidateMode? autovalidateMode;
  double? height;

  CustomTextFormField(
      {Key? key,
      this.textInputType,
      this.prefixIcon,
      this.height = 58,
      this.suffixIcon,
      this.autovalidateMode,
      this.maxLines = 1,
      this.label = '',
      this.icon,
      this.labelColor,
      this.fillingColor = primaryLightGrayBGColor,
      this.hintText = '',
      this.obscureText,
      this.controller,
      this.validator,
      this.onSaved,
      this.onTap,
      this.autofocus = false,
      this.isEnabled = true,
      this.keyboardType,
      this.inputFormatters,
      this.labelText,
      this.filled = false,
      this.useUnderline = false,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // useUnderline == true
          //     ? const SizedBox.shrink()
          //     : Text(
          //         label!,
          //         style: TextStyle(
          //             fontSize: 16.sp,
          //             color: labelColor ?? primaryLightGrayBGColor,
          //             fontWeight: FontWeight.w400),
          //       ),
          // useUnderline == true ? HSpace(0.h) : HSpace(0.h),
          TextFormField(
            // textAlign: useUnderline == true ? TextAlign.center : TextAlign.left,
            style: TextStyle(
                color: pmTheme.text!,
                letterSpacing: useUnderline == true ? 0.0 : 0.0,
                fontSize: useUnderline == true ? 14.sp : 14.sp,
                fontWeight: FontWeight.w400),
            enabled: isEnabled,

            textCapitalization: TextCapitalization.sentences,
            autovalidateMode: autovalidateMode,
            inputFormatters: inputFormatters,
            controller: controller,
            onTap: onTap,
            maxLines: maxLines,
            obscureText: obscureText ?? false,
            obscuringCharacter: '*',
            keyboardType: textInputType,
            validator: validator,
            onChanged: onSaved,
            decoration: InputDecoration(
              suffix: suffix,
              focusColor: Colors.amber,

              floatingLabelBehavior: FloatingLabelBehavior.never,
              // helperText: labelText,
              labelText: labelText,
              // label: Padding(
              //   padding: EdgeInsets.only(top: 35.h),
              //   child: Styles.regular(
              //     labelText ?? "",
              //     fontSize: 16.sp,
              //     color: grayscalLabel,
              //   ),
              // ),
              labelStyle: TextStyle(
                fontSize: 14.sp,
                color: pmTheme.text!,
              ),
              // helperStyle: TextStyle(
              //   fontSize: 16.sp,
              //   color: grayscaleLabel,
              // ),

              errorStyle: TextStyle(
                color: pmTheme.red!,
                fontSize: 12.sp,
                height: 0.10,
              ),
              contentPadding: EdgeInsets.only(
                  top: 14.h, bottom: 13.h, left: 14.w, right: 14.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: underlineGrayColor,
                  // color: Colors.transparent,
                  width: 1.w,
                  style: BorderStyle.solid,
                ),
              ),
              // fillColor: filled == false ? primaryLightGrayBGColor : fillingColor,
              fillColor:
                  useUnderline != true ? Colors.transparent : fillingColor,
              filled: filled,

              // filled: filled ?? false,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: pmTheme.text!,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: useUnderline == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                          color: primaryColor,
                          width: 1.w,
                          style: BorderStyle.solid),
                    )
                  // UnderlineInputBorder(
                  //         borderSide: BorderSide(color: underlineGrayColor))
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                          color: primaryColor,
                          width: 1.w,
                          style: BorderStyle.solid)),
              enabledBorder: useUnderline == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                          color: primaryColor,
                          width: 1.w,
                          style: BorderStyle.solid),
                    )
                  // const UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.black26))
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                          color: underlineGrayColor,
                          width: 1.w,
                          style: BorderStyle.solid)),
              errorBorder: useUnderline == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                          color: underlineGrayColor,
                          width: 0.2.w,
                          style: BorderStyle.solid),
                    )
                  // ? const UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.black26))
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                          color: underlineGrayColor,
                          width: 1.w,
                          style: BorderStyle.solid),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
