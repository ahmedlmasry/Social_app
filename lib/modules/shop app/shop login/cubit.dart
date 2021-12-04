import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/models/shop_app/home_model.dart';
import 'package:groub/models/shop_app/login_model.dart';
import 'package:groub/modules/shop%20app/shop%20login/states.dart';

import 'package:groub/shared/network/remote/dio_helper.dart';
import 'package:groub/shared/network/remote/endpoints.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginIntialStates());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;

  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingStates());

    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopLoginsuccessStates(loginModel!));
    }).catchError((error) {
      emit(ShopLoginErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisbility() {
    // suffix = Icons.visibility_off_outlined;
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.verified_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisbilityStates());
  }
}
