import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:groub/modules/login/model.dart';

class LodinController {
  LoginModel _loginModel = LoginModel(data: null, message: '', success: null);
  Dio _dio = Dio();
  Future<LoginModel> userLogin(
      {required String phoneNumber, required String password}) async {
    FormData _formData =
        FormData.fromMap({'phone': phoneNumber, 'password': password});

    var response =
        await _dio.post('http://www.mzaadi.com/api/login', data: _formData);
    var data = json.decode(response.toString());
    _loginModel = LoginModel.fromJson(data);
    return _loginModel;
  }
}
