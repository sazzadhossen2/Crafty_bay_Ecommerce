import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:http/http.dart';

class NetworkColler {
  Future<ResponceData> getRequest(String uri,{String?token}) async {
    final Response response = await get(Uri.parse(uri),headers: {
      'token':(token??Authcontroller.token).toString(),
      'Content-Type':'application/json'
    });
    log(uri);
     log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final decode =await jsonDecode(response.body);

      if (decode['msg'] == 'success') {
        return ResponceData(
            isSuccess: true,
            statusCode: response.statusCode,
            responceData: decode);
      } else {
        return ResponceData(
            isSuccess: false,
            statusCode: response.statusCode,
            responceData: '',
            isError: decode['data'] ?? 'Something wrong');
      }
    } else if(response.statusCode==401){
      await Authcontroller.ClearData();
      Authcontroller.GotoLogin();
      return ResponceData(
        isSuccess: false,
        statusCode: response.statusCode,
        responceData: '',
      );

    }
    else {
      return ResponceData(
        isSuccess: false,
        statusCode: response.statusCode,
        responceData: '',
      );
    }
  }

  Future<ResponceData> postRequest(String uri,{Map<String,dynamic>?body,String?token}) async {
    final Response response = await post(Uri.parse(uri),body: jsonEncode(body),
        headers: {
      'token':Authcontroller.token.toString(),
      'Content-Type':'application/json'
    });
    if (response.statusCode == 200) {
      final decode =await jsonDecode(response.body);
     log(uri);
      log(decode);
      log(response.statusCode.toString());
      if (decode['msg'] == 'success') {
        return ResponceData(
            isSuccess: true,
            statusCode: response.statusCode,
            responceData: decode);
      } else {
        return ResponceData(
            isSuccess: false,
            statusCode: response.statusCode,
            responceData: '',
            isError: decode['data'] ?? 'Something wrong');
      }
    } else if(response.statusCode==401){
      await Authcontroller.ClearData();
      Authcontroller.GotoLogin();
      return ResponceData(
        isSuccess: false,
        statusCode: response.statusCode,
        responceData: '',
      );
    }
    else {
      return ResponceData(
        isSuccess: false,
        statusCode: response.statusCode,
        responceData: '',
      );
    }
  }
}
