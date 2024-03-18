import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/utils/color.dart';
import '../../../shared/utils/styles.dart';
import '../../../shared/utils/themes/theme.dart';
import '../../../shared/widgets/space.dart';

PreferredSize buildPreferredSize({String? label, context}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(350.h),
    child: Padding(
      padding: EdgeInsets.only(top: 80.h, left: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Platform.isAndroid
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24.sp,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor,
                    size: 24.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
          WSpace(8.w),
          Styles.semiBold(label ?? "",
              fontSize: 20.sp, color: pmTheme.text, align: TextAlign.left)
        ],
      ),
    ),
  );
}
