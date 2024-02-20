

import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_button_nav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_logo.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movenext();
  }

void movenext()async{
await Future.delayed(const Duration(seconds: 3));
// final bool isLogin=await Get.find<Authcontroller>().isLogin();
// if(isLogin){
//
//   Get.offAll(const Verifyemailscreen());
// }
await Get.find<Authcontroller>().inisilize();
Get.to(()=>const MainButtonNavButton());
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: Center(
  child: Column(
    children: [
      Spacer(),
      Applogo(),
      Spacer(),
      CircularProgressIndicator(),
      SizedBox(height: 16,),
      Text('version 1.0'),
      SizedBox(height: 26,),
    ],
  ),
),
    );
  }
}
