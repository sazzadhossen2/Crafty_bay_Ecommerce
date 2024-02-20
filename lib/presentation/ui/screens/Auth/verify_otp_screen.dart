import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_button_nav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/app_colors.dart';
import '../../widgets/app_logo.dart';
import 'compelet_profile.dart';

class VerifyOtpScreen extends StatefulWidget {
  VerifyOtpScreen({super.key, required this.email});

  String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _passwordText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Applogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'a 4 digit OTP code has been sent',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  controller: _passwordText,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.purple),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<VerifyOtpController>(
                    builder: (verifyOtp) {
                      return SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: verifyOtp.inProgress == false,
                            replacement: const Center(
                                child: CircularProgressIndicator()),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final bool result =
                                    await Get.find<VerifyOtpController>()
                                        .verofyOtp(
                                        widget.email, _passwordText.text);
                                    if (result) {
                                      if (verifyOtp.NavigationCompleteProfile) {
                                        Get.to(const Compeletprofile());
                                      }
                                      else {
                                        Get.to(const MainButtonNavButton());
                                      }
                                    } else {
                                      Get.showSnackbar(GetSnackBar(
                                        title: 'Something Wrong',
                                        message: verifyOtp.anError,
                                        isDismissible: true,
                                        duration: const Duration(seconds: 2),
                                      ));
                                    }
                                  }
                                },
                                child: const Text("Next")),
                          ));
                    }
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(text: 'This code will Expired '),
                          TextSpan(
                              text: ' 120s',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600))
                        ])),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(color: Colors.grey),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
