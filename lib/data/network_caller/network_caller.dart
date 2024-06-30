import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/presentations/state_holder/user_auth_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/email_verification_screen.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, bool formAuth = false}) async {
    try {
      log(url);
      log(UserAuthController.accessToken);
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'token': UserAuthController.accessToken
        },
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        log(response.statusCode.toString());
        log(response.body);
        return NetworkResponse(
            isSuccess: true,
            responseCode: response.statusCode,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        if (!formAuth) {
          _gotoSignInScreen();
        }
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      } else {
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(isSuccess: false, responseCode: -1);
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      log(url);
      final Response response = await post(Uri.parse(url),
          headers: {
            'accept': 'application/json',
            'token': UserAuthController.accessToken
          },
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        log(response.statusCode.toString());
        log(response.body);
        return NetworkResponse(
            isSuccess: true,
            responseCode: response.statusCode,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        _gotoSignInScreen();
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      } else {
        return NetworkResponse(
            isSuccess: false, responseCode: response.statusCode);
      }
    } catch (e) {
      log(e.toString());
      return NetworkResponse(isSuccess: false, responseCode: -1);
    }
  }

  static Future<void> _gotoSignInScreen() async {
    await UserAuthController.clearUserData();
    getx.Get.to(() => const EmailVerificationScreen());
  }
}
