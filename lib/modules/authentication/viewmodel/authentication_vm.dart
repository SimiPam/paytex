// ignore_for_file: curly_braces_in_flow_control_structures, file_names, use_build_context_synchronously, unused_local_variable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/base/base_viewmodel.dart';
import '../../../core/service-injector/service_injector.dart';
import '../../../shared/models/authentication/sign_in_data.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  AuthViewModel({this.context});

  //form keys
  final signInFormKey = GlobalKey<FormState>();

  final FocusNode pinPutFocusNode = FocusNode();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  FutureOr<void> init() async {
    // prefs = await SharedPreferences.getInstance();
    si.siEmail('John Doe');
  }

  //text controllers
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInpasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  // SharedPreferences? prefs;
  String? message;

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  //state variables
  bool passVisible = false;
  bool confirmPassVisible = false;
  bool showClear = false;
  bool showClearPassword = false;
  bool showConfirmPassword = false;

  hidePassword() {
    passVisible = !passVisible;
    notifyListeners();
  }

  hideConfirmPassword() {
    confirmPassVisible = !confirmPassVisible;
    notifyListeners();
  }

  startUserLogin() async {
    final signInData = SignInData(
      email: signInEmailController.text.trim(),
      password: signInpasswordController.text.trim(),
    );

    // Navigator.pushNamed(context!, RoutePaths.findEmployer);
  }

  validateSignIn() {
    if (signInFormKey.currentState!.validate()) {
      // save data
      signInFormKey.currentState!.save();
      startUserLogin();
    }
  }
}
