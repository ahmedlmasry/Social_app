import 'package:flutter/material.dart';

class FristScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FristScreen> {
  Widget _textinput(String hint, bool secure, Icon icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: icon,
            labelText: hint,
            hintStyle: TextStyle(color: Colors.grey)),
        obscureText: secure,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Text('LOGIN',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            )),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              height: 40,
              width: 120,
              margin: EdgeInsets.only(right: 30, left: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue[900]),
              child: Center(
                child: Text(
                  'FaceBook',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 120,
              margin: EdgeInsets.only(right: 20, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue[700]),
              child: Center(
                child: Text(
                  'Twitter',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'OR',
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        _textinput('User Name', false, Icon(Icons.person, color: Colors.black)),
        _textinput('Password', true, Icon(Icons.lock)),
        SizedBox(
          height: 5,
        ),
        Text('Forget password ?',
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            )),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue[400],
          ),
          child: Center(
            child: Text('LOGIN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal)),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          ' Dont have an acount ? ',
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text('SIGN UP ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
      ],
    ));
  }
}
