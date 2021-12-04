import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/modules/social/social_login/cubit/states.dart';
import 'package:groub/shared/styles/icon_broken.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginIntialStates());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    emit(SocialLoginLoadingStates());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginsuccessStates(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisbility() {
    // suffix = Icons.visibility_off_outlined;
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.verified_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisbilityStates());
  }
}
