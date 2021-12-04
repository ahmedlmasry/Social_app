import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/social%20layout/social_layout.dart';
import 'package:groub/modules/social/social_login/cubit/cubit.dart';
import 'package:groub/modules/social/social_login/cubit/states.dart';
import 'package:groub/modules/social/social_register/social-register.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/network/local/cache_helper.dart';
import 'package:groub/shared/styles/icon_broken.dart';

class SocialLogin extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorStates) {
            showToast(text: state.error, states: Toaststates.ERROR);
          }
          if (state is SocialLoginsuccessStates) {
            CacheHelper.saveData(value: state.uId, key: 'uId').then((value) {
              navigateAndFinish(context, SocialLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        Text(
                          'login now to communicate with frindes',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defalutFormfeild(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            valdiate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            label: 'Email Address',
                            prefix: IconBroken.Message),
                        SizedBox(
                          height: 15,
                        ),
                        defalutFormfeild(
                            suffix: SocialLoginCubit.get(context).suffix,
                            suffixpressed: () {
                              SocialLoginCubit.get(context)
                                  .changePasswordVisbility();
                            },
                            onSubmited: (value) {
                              if (formkey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            ispassword:
                                SocialLoginCubit.get(context).isPassword,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            valdiate: (value) {
                              if (value.isEmpty) {
                                return 'password is to short';
                              }
                            },
                            label: 'password',
                            prefix: IconBroken.Lock),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formkey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            text: 'login',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have any account?'),
                              defaultTextButton(
                                  function: () {
                                    navigateTo(context, SocialRegisterScreen());
                                  },
                                  text: 'register')
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
