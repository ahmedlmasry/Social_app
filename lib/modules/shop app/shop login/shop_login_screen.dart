//import 'dart:developer';

//import 'package:conditional_builder/conditional_builder.dart';
//import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groub/layout/shop_app/shop_layout.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:groub/layout/todo_app/todo_layout.dart';
import 'package:groub/modules/shop%20app/register/shop_register_screen.dart';
import 'package:groub/modules/shop%20app/shop%20login/cubit.dart';
//import 'package:groub/modules/shop%20app/register/shop_register_screen.dart';
import 'package:groub/modules/shop%20app/shop%20login/states.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/network/local/cache_helper.dart';
//import 'package:groub/shared/cubit/cubit.dart';
//import 'package:groub/shared/cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
            listener: (context, state) {
          if (state is ShopLoginsuccessStates) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                      value: state.loginModel.data!.token, key: 'token')
                  .then((value) {
                navigateAndFinish(context, ShopLayout());
              });
            } else {
              print(state.loginModel.message);
              showToast(
                  text: state.loginModel.message!, states: Toaststates.ERROR);
            }
          }
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        Text(
                          'login now to btowse our hot offers',
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
                              return null;
                            },
                            label: 'Email Address',
                            prefix: Icons.email),
                        SizedBox(
                          height: 15,
                        ),
                        defalutFormfeild(
                            suffix: ShopLoginCubit.get(context).suffix,
                            suffixpressed: () {
                              ShopLoginCubit.get(context)
                                  .changePasswordVisbility();
                            },
                            onSubmited: (value) {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            ispassword: ShopLoginCubit.get(context).isPassword,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            valdiate: (value) {
                              if (value.isEmpty) {
                                return 'password is to short';
                              }
                            },
                            label: 'password',
                            prefix: Icons.lock_outline),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingStates,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
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
                              Text('Dont have any account'),
                              defaultTextButton(
                                  function: () {
                                    navigateTo(context, ShopRegisterScreen());
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
        }));
  }
}
