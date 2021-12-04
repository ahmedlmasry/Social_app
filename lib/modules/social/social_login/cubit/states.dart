abstract class SocialLoginStates {}

class SocialLoginIntialStates extends SocialLoginStates {}

class SocialLoginLoadingStates extends SocialLoginStates {}

class SocialLoginsuccessStates extends SocialLoginStates {
  late final String uId;
  SocialLoginsuccessStates(this.uId);
}

class SocialLoginErrorStates extends SocialLoginStates {
  final String error;
  SocialLoginErrorStates(this.error);
}

class SocialChangePasswordVisbilityStates extends SocialLoginStates {}
