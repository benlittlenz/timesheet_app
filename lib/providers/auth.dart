import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:timesheet_app/models/User.dart';

import '../dio.dart';

class Auth extends ChangeNotifier {
  final _storage = FlutterSecureStorage();
  bool _isAuthenticated = false;
  User _user;

  bool get authenticated => _isAuthenticated;
  User get user => _user;

  Future login({Map credentials}) async {
    String deviceId = await getDeviceId();

    Dio.Response response = await dio().post('auth/token',
        data: json.encode(credentials..addAll({'deviceId': deviceId}))
        //data: json.encode(credentials)
        );
    String token = json.decode(response.toString())['token'];

    debugPrint(token);
  }

  void logout() async {}

  Future getDeviceId() async {
    String deviceId;

    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (err) {
      debugPrint('No device Id');
    }
    debugPrint(deviceId);
    return deviceId;
  }
}
