import 'package:crafty_bay/presentation/state_holders/verify_email_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_logo.dart';
class Verifyemailscreen extends StatefulWidget {
  const Verifyemailscreen({super.key});
  @override
  State<Verifyemailscreen> createState() => _VerifyemailscreenState();
}
class _VerifyemailscreenState extends State<Verifyemailscreen> {
  final TextEditingController _emailText = TextEditingController();
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
                  height: 160,
                ),
                const Applogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'WellCome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'please enter your address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailText,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<VerifyEmailController>(builder: (verifyEmail) {
                  return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: verifyEmail.isSuccess == false,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final bool result =
                                    await verifyEmail.verifyEmailController(
                                        _emailText.text.toString());
                                if (result) {
                                  Get.to(VerifyOtpScreen(
                                    email: _emailText.text.toString(),
                                  ));
                                } else {
                                  Get.showSnackbar(GetSnackBar(
                                    title: 'something Wrong',
                                    message: verifyEmail.anError,
                                    duration: const Duration(seconds: 2),
                                    isDismissible: true,
                                  ));
                                }
                              }
                            },
                            child: const Text("Next")),
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
