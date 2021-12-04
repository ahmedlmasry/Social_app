import 'package:flutter/material.dart';
import 'package:groub/modules/login/controller.dart';
import 'package:groub/modules/login/model.dart';
import 'package:groub/modules/login/text_field.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String _phonenumber, _password;
  LodinController _lodinController = LodinController();
  LoginModel _loginModel = LoginModel(data: null, message: '', success: null);
  _validateform() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();
    _loginModel = await _lodinController.userLogin(
        phoneNumber: _phonenumber, password: _password);
    print(_loginModel.data!.user!.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Form(
              key: _formkey,
              child: Column(
                children: [
                  textField(
                      hint: 'Phone Number',
                      secure: false,
                      onsave: (value) {
                        setState(() {
                          _phonenumber = value;
                        });
                      },
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'phone number is reqired';
                        } else {
                          //  return null;
                        }
                      }),
                  textField(
                      hint: 'password',
                      secure: true,
                      onsave: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'password is reqired';
                        } else {
                          //  return null;
                        }
                      }),
                ],
              )),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              _validateform();
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: Center(
                child: Text(
                  'login',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
