import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:timesheet_app/dio.dart';
import 'package:timesheet_app/models/User.dart';


class Auth extends ChangeNotifier {
  final _storage = FlutterSecureStorage();
  bool _isAuthenticated = false;
  User _user;

  bool get authenticated => _isAuthenticated;
  User get user => _user;

  Future login ({Map credentials}) async {
    String deviceId = await getDeviceId();

    Dio.Response response = await dio().post('auth/token',
        data: json.encode(credentials..addAll({'deviceId': deviceId})));
    String token = json.decode(response.toString())['token'];

    await attempt(token);
    storeToken(token);
  }

  Future attempt (String token) async {
    try {
      Dio.Response response = await dio().get('auth/user',
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
      _user = User.fromJson(json.decode(response.toString()));
      _isAuthenticated = true;
    } catch (err) {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  Future getDeviceId () async {
    String deviceId;

    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (err) {
      debugPrint('No device Id');
    }
    debugPrint(deviceId);
    return deviceId;
  }

  Future fetchtoken () async {
    return await _storage.read(key: 'auth');
  }

  storeToken(String token) async {
    await _storage.write(key: 'auth', value: token);
  }

  deleteToken() async {
    await _storage.delete(key: 'auth');
  }

  void logout () async {
    _isAuthenticated = false;

    await dio().delete(
      'auth/token',
      data: {
        'deviceId': await getDeviceId()
      },
      options: Dio.Options(
        headers: { 'auth': true }
      )
    );

    await this.deleteToken();

    notifyListeners();
  }
}
