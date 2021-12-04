import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.black,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 - 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/mixed-pizza-with-sliced-lemon_140725-2808.jpg?size=626&ext=jpg&ga=GA1.2.398855228.1603234672'),
                        fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    'Dosa',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                left: 30,
                right: 30,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: Colors.white,
                        ),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.yellow),
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '4.5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, bottom: 3),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ])),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Text(
              'About',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'The standard chunk of lorem ipsum used scince the 1500s is reproduced below for those intersted.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'sections 1.10.32 and 1.10.33 from de finibus',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'Bonorum et maloeum by cicero',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Delivery',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Text(
                  'Free',
                  style: TextStyle(color: Colors.yellow, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 50),
                  child: Text(
                    'Time',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Text(
                  '06:00am-11:00pm',
                  style: TextStyle(color: Colors.yellow, fontSize: 15),
                ),
              ],
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Text(
              'Comment ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSpquvuPKa_WRHXcGJub_Qt0GNZRRWA8GIhqg&usqp=CAU'),
                          fit: BoxFit.cover)),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 15),
                    child: Text(
                      'chopra',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            onPressed: () {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'Sep22,2020',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
