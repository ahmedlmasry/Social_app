import 'package:flutter/material.dart';

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzRbFCA2yLVgqnJoSjp9AYdTt_OapvbAImhw&usqp=CAU',
                        ),
                        fit: BoxFit.cover),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(60)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child:
                    IconButton(icon: Icon(Icons.account_box), onPressed: () {}),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              'Ahmed ELmasry',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              '@ahmedelmasry',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              '100 Following   500 Followers',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.person), onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.list), onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              Text(
                'Lists',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.comment), onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              Text(
                'Topics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bookmarks',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.schedule), onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              Text(
                'Momments',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: Text(
              'Settings and privacy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: Text(
              'Help Center',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.lightbulb_outline), onPressed: () {}),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child:
                    IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
