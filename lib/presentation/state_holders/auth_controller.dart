import 'dart:async';
import 'dart:convert';

import 'package:crafty_bay/data/model/profile.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth/verify_email_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontroller extends GetxController {
 static String? token;
  ProfileData? profiles;

  Future<void> SaveUserData(String t, ProfileData profileData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', t);
    sharedPreferences.setString('profile', jsonEncode(profileData.toJson()));
    token = t;
    profiles = profileData;
  }

  Future<void> inisilize() async {
    token = await _getToken();
    profiles = await _getProfile();
  }

  Future<bool> isLogin() async {
    await inisilize();
    return token != null;
  }

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString('token');
    return null;
  }

  bool get isTokenNotNull => token != null;

  Future<ProfileData?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? profile = sharedPreferences.getString('profile');
    if (profile == null) {
      return null;
    } else {
      return ProfileData.fromJson(jsonDecode(profile));
    }
  }

 static Future<void> ClearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  static Future<void>GotoLogin()async{
    Get.to(()=>const Verifyemailscreen());
  }
}
