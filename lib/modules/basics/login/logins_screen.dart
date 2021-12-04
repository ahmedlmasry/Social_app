import 'package:flutter/material.dart';
import 'package:groub/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defalutFormfeild(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    valdiate: (value) {
                      if (value.isempty) {
                        return 'email must be not empty';
                      }
                      //  return null;
                    },
                    label: 'email',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defalutFormfeild(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      valdiate: (value) {
                        if (value.isempty) {
                          return 'password must be not empty';
                        }
                        //  return null;
                      },
                      label: 'password',
                      prefix: Icons.lock,
                      ispassword: ispassword,
                      suffixpressed: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                      suffix:
                          ispassword ? Icons.visibility : Icons.visibility_off),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    text: 'login',
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
