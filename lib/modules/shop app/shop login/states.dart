import 'package:groub/models/shop_app/login_model.dart';
import 'package:groub/modules/shop%20app/register/shop_register_screen.dart';

abstract class ShopLoginStates {}

class ShopLoginIntialStates extends ShopLoginStates {}

class ShopLoginLoadingStates extends ShopLoginStates {}

class ShopLoginsuccessStates extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginsuccessStates(this.loginModel);
}

class ShopLoginErrorStates extends ShopLoginStates {
  final String error;
  ShopLoginErrorStates(this.error);
}

class ShopChangePasswordVisbilityStates extends ShopLoginStates {}
