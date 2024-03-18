// ignore_for_file: null_argument_to_non_null_type

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../shared/models/authentication/auth_model.dart';
import '../service-injector/service_injector.dart';
import 'storage_service.dart';
import 'store_service.dart';

class AuthenticationService {
  AuthenticationService({
    required this.storageService,
    required this.storeService,
  });

  StorageService storageService;
  StoreService storeService;

  Future<AuthPayload> getAuthData() async {
    final Completer<AuthPayload> completer = Completer<AuthPayload>();
    final String data = si.storageService.getItemSync('auth_data');

    if (data.isEmpty) {
      completer.complete(null);
    } else {
      final AuthPayload auth = AuthPayload.fromJson(json.decode(data));
      completer.complete(auth);
    }
    return completer.future;
  }

  Future<dynamic> loginService(
      Map<String, dynamic> requestData, BuildContext context) {
    return si.apiService!.authPostApi<AuthPayload>(
      'connect/token',
      requestData,
      context,
      transform: (dynamic res) {
        return res;
      },
    );
  }

  // Future<ApiResponse<dynamic>> firstTimeUserCheckService(
  //     String userID, BuildContext context) {
  //   return si.apiService!.getApiAuthDomain<dynamic>(
  //     'Auth/CheckFirstTimeUser2/$userID',
  //     useToken: false,
  //     context: context,
  //     transform: (dynamic res) {
  //       return res;
  //     },
  //   );
  // }
  //
  // Future<ApiResponse<dynamic>> forgotPasswordService(String email,
  //     {required BuildContext context}) {
  //   return si.apiService!.getApiAuthDomain<dynamic>(
  //     'User/SendForgetPasswordOTP/$email',
  //     useToken: false,
  //     context: context,
  //     transform: (dynamic res) {
  //       return res;
  //     },
  //   );
  // }
  //
  // Future<ApiResponse<dynamic>> resetPasswordService(Map<String, dynamic> body,
  //     {required BuildContext context}) {
  //   return si.apiService!.postApiAuthDomain<dynamic>(
  //     'User/ResetPasswordByOtp',
  //     body,
  //     useToken: false,
  //     context: context,
  //     transform: (dynamic res) {
  //       return res;
  //     },
  //   );
  // }
  //
  // Future<ApiResponse<dynamic>> verifyEmailService(Map<String, String> body,
  //     {required BuildContext context}) {
  //   return si.apiService!.getApiAuthDomain<dynamic>(
  //     'User/VerifyDataOwnerEmail',
  //     params: body,
  //     useToken: false,
  //     context: context,
  //     transform: (dynamic res) {
  //       return res;
  //     },
  //   );
  // }
  //
  // Future<ApiResponse<ChangePassPayload>> changePass(Map<String, String> body,
  //     {required BuildContext context}) {
  //   return si.apiService!.postApiPassAuthDomain<ChangePassPayload>(
  //     'Auth/ChangePassword',
  //     body,
  //     useToken: true,
  //     context: context,
  //     transform: (dynamic res) {
  //       return ChangePassPayload.fromJson(res);
  //     },
  //   );
  // }
}
