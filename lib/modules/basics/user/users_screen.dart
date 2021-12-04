import 'package:flutter/material.dart';
//import 'package:groub/login/model.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'ahmed elmasry',
      phone: '0128737673',
    ),
    UserModel(
      id: 2,
      name: 'mohamed elmasry',
      phone: '010998787373',
    ),
    UserModel(
      id: 1,
      name: 'ali elmasry',
      phone: '0154576737673',
    ),
    UserModel(
      id: 1,
      name: 'ahmed elmasry',
      phone: '0128737673',
    ),
    UserModel(
      id: 2,
      name: 'mohamed elmasry',
      phone: '010998787373',
    ),
    UserModel(
      id: 1,
      name: 'ali elmasry',
      phone: '0154576737673',
    ),
    UserModel(
      id: 1,
      name: 'ahmed elmasry',
      phone: '0128737673',
    ),
    UserModel(
      id: 2,
      name: 'mohamed elmasry',
      phone: '010998787373',
    ),
    UserModel(
      id: 1,
      name: 'ali elmasry',
      phone: '0154576737673',
    ),
    UserModel(
      id: 1,
      name: 'ahmed elmasry',
      phone: '0128737673',
    ),
    UserModel(
      id: 2,
      name: 'mohamed elmasry',
      phone: '010998787373',
    ),
    UserModel(
      id: 1,
      name: 'ali elmasry',
      phone: '0154576737673',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: Text(
              '${user.id}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${user.phone}',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
            ],
          )
        ],
      ));
}
