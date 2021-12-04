import 'package:flutter/material.dart';

class TawlaHomeScreen extends StatefulWidget {
  @override
  _TawlaHomeScreenState createState() => _TawlaHomeScreenState();
}

class _TawlaHomeScreenState extends State<TawlaHomeScreen> {
  List<Map<String, dynamic>> _data = [
    {
      'image': 'assets/images/rest1.png',
      'name': 'مطعم بريمر ',
      'address': 'مصر - المنصوره'
    },
    {
      'image': 'assets/images/rest2.png',
      'name': 'مطعم المحمدي ',
      'address': 'مصر - المنصورة'
    },
    {
      'image': 'assets/images/rest3.png',
      'name': ' مطعم شقوير',
      'address': 'مصر - المنصورة'
    },
  ];
  Widget _card(
      {required String image,
      required String txt1,
      required Icon icon,
      required String txt2}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 40,
          child: Text(
            txt1,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Positioned(bottom: 20, right: 40, child: icon),
        Positioned(
          bottom: 20,
          right: 60,
          child: Text(
            txt2,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [
          Container(
              margin: EdgeInsets.all(10),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage('assets/images/appicon.png'),
                    fit: BoxFit.cover),
              )),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset('assets/images/notification.png'),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusColor: Colors.blue,
                    hintText:
                        '                                              عاوز تاكل فين انهارده؟ ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 40),
                child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/fast.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (ctx, index) {
                    return _card(
                        image: _data[index]['image'],
                        txt1: _data[index]['name'],
                        txt2: _data[index]['address'],
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ));
                  }))
        ],
      ),
    );
  }
}
