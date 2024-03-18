import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/authentication/viewmodel/authentication_vm.dart';
import '../../router/route_paths.dart';
import '../../shared/utils/assets.dart';
import '../../shared/utils/color.dart';
import '../../shared/utils/themes/theme.dart';
import '../../shared/utils/utils.dart';
import '../../shared/utils/validator.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_textformfield.dart';
import '../../shared/widgets/space.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        vmBuilder: (context) => AuthViewModel(context: context),
        builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: deviceHeight(context),
        width: deviceWidth(context),
        color: primaryWhiteBGColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 77.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Styles.medium('Welcome back', color: pmTheme.text, fontSize: 20.sp),
            HSpace(8.h),
            Styles.regular('Enter your employee ID to login.',
                color: pmTheme.text, fontSize: 14.sp),
            HSpace(22.h),
            _signInForm(viewModel),
            HSpace(30.h),
            CustomButton(
                margin: 0.w,
                title: 'Login',
                isActive: true,
                nonActiveBtnColor: primaryColor.withOpacity(0.4),
                txtColor: primaryWhiteColor,
                txtSize: 16.sp,
                fontWeight: FontWeight.normal,
                onPress: viewModel.validateSignIn),
            HSpace(24.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.forgotPassword);
                },
                child: Styles.semiBold('I forgot my password',
                    color: pmTheme.text, fontSize: 14.sp),
              ),
            ),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.signUp);
                },
                child: Styles.semiBold('Don’t have an account? Sign up',
                    color: pmTheme.text!, fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form _signInForm(AuthViewModel viewModel) {
    return Form(
        key: viewModel.signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: viewModel.signInEmailController,
              validator: FieldValidator.validate,
              fillingColor: pmTheme.text,
              filled: viewModel.showClear,
              autofocus: false,
              useUnderline: viewModel.showClear,
              onSaved: (val) {
                if (val.isEmpty) {
                  viewModel.showClear = false;
                } else {
                  viewModel.showClear = true;
                }
                viewModel.notifyListeners();
              },
              suffixIcon: IconButton(
                onPressed: () {
                  viewModel.signInEmailController.clear();
                  viewModel.showClear = false;
                  viewModel.notifyListeners();
                },
                icon: !viewModel.showClear
                    ? const SizedBox()
                    : Icon(
                        size: 24.sp,
                        Icons.clear,
                        color: pmTheme.text,
                      ),
              ),
              labelText: "Employee ID",
              labelColor: pmTheme.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            HSpace(20.h),
            CustomTextFormField(
              labelText: "Password",
              fillingColor: pmTheme.text,
              filled: viewModel.showClearPassword,
              useUnderline: viewModel.showClearPassword,
              autofocus: false,
              onSaved: (value) {
                if (value.isEmpty) {
                  viewModel.showClearPassword = false;
                } else if (!FormUtils.hasMinLength(value)) {
                  viewModel.showClearPassword = false;
                } else {
                  viewModel.showClearPassword = true;
                }
                viewModel.notifyListeners();
              },
              labelColor: pmTheme.text,
              controller: viewModel.signInpasswordController,
              obscureText: !viewModel.passVisible,
              validator: PasswordValidator.validateLoginPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.hidePassword();
                  },
                  icon: viewModel.passVisible
                      ? Padding(
                          padding: EdgeInsets.only(right: 12.sp),
                          child: Image.asset(
                              width: 24.w,
                              height: 24.h,
                              ImageAssets.view,
                              color: pmTheme.text),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 12.sp),
                          child: Image.asset(ImageAssets.hide,
                              width: 24.w, height: 24.h, color: pmTheme.text),
                        )),
            ),
          ],
        ));
  }
}
