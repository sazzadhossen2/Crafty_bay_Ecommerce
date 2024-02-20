import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/creat_prodile_perems.dart';
import '../../../state_holders/creatProfile_controller.dart';
import '../../widgets/app_logo.dart';
import '../main_button_nav_button.dart';

class Compeletprofile extends StatefulWidget {
  const Compeletprofile({super.key});

  @override
  State<Compeletprofile> createState() => _CompeletprofileState();
}

class _CompeletprofileState extends State<Compeletprofile> {

  final TextEditingController _cusname = TextEditingController();
  final TextEditingController _cusadd = TextEditingController();
  final TextEditingController _cusCity = TextEditingController();
  final TextEditingController _cusSstate = TextEditingController();
  final TextEditingController _cusPostcode = TextEditingController();
  final TextEditingController _cusCountry = TextEditingController();
  final TextEditingController _cusPhone = TextEditingController();
  final TextEditingController _cusFax = TextEditingController();
  final TextEditingController _shipName = TextEditingController();
  final TextEditingController _shipAdd = TextEditingController();
  final TextEditingController _shiCity = TextEditingController();
  final TextEditingController _shipStatus = TextEditingController();
  final TextEditingController _shipPostcode = TextEditingController();
  final TextEditingController _shipCountry = TextEditingController();
  final TextEditingController _shippPhone = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                const Applogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Complete Profile',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Get Started with us with your details',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                const SizedBox(height: 16,),


                TextFormField(
                  controller: _cusname,
                  decoration: const InputDecoration(hintText: 'cus name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),

                /////////////////////
                TextFormField(
                  controller: _cusadd,
                  decoration: const InputDecoration(hintText: 'cus add'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _cusCity,
                  decoration: const InputDecoration(hintText: 'cus city'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusSstate,
                  decoration: const InputDecoration(hintText: 'cus state'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusPostcode,
                  decoration: const InputDecoration(hintText: 'cus postcode'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusCountry,
                  decoration: const InputDecoration(hintText: 'cus country'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusPhone,
                  decoration: const InputDecoration(hintText: 'cus phone'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusFax,
                  decoration: const InputDecoration(hintText: 'cus fax'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shipName,
                  decoration: const InputDecoration(hintText: 'ship name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shipAdd,
                  decoration: const InputDecoration(hintText: 'ship add'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shiCity,
                  decoration: const InputDecoration(hintText: 'ship city'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _shipStatus,
                  decoration: const InputDecoration(hintText: 'ship status'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shipPostcode,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: 'ship postCode'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shipCountry,
                  decoration: const InputDecoration(hintText: 'Ship Country'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _shippPhone,
                  //  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Ship phone'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<CreatProfileController>(
                    builder: (CreatProfile) {
                      return SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: CreatProfile.inProgress == false,
                            replacement: const CircularProgressIndicator(),
                            child: ElevatedButton(onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                final creatParams= CreatProfilePerams(
                                    cusAdd: _cusadd.text.trim(),
                                    cusName: _cusname.text.trim(),
                                    cusCity: _cusCity.text.trim(),
                                    cusState: _cusSstate.text.trim(),
                                    cusPostcode: _cusPostcode.text.trim(),
                                    cusCountry: _cusCountry.text.trim(),
                                    cusPhone: _cusPhone.text.trim(),
                                    cusFax: _cusFax.text.trim(),
                                    shipName: _cusname.text.trim(),
                                    shipAdd: _cusadd.text.trim(),
                                    shipCity: _shiCity.text.trim(),
                                    shipState: _shipStatus.text.trim(),
                                    shipPostcode: _shipPostcode.text.trim(),
                                    shipCountry: _shipCountry.text.trim(),
                                    shipPhone: _shippPhone.text.trim());
                                final bool result = await CreatProfile
                                    .creatProfile(Get
                                    .find<VerifyOtpController>()
                                    .token, creatParams);
                                if(result){
                                  Get.to(()=>const MainButtonNavButton());
                                }
                                else{
                                  Get.showSnackbar(GetSnackBar(
                                    title: 'Somethin wrong',
                                    message: CreatProfile.anError,
                                    isDismissible: true,
                                    duration: const Duration(seconds: 2),
                                  ));
                                }
                              }

                              Get.to(const MainButtonNavButton());
                            }, child: const Text("Next")),
                          ));
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}