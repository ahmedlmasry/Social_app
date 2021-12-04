import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Details',
            style: TextStyle(color: Colors.black26, fontSize: 15),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black26,
                ),
                onPressed: () {})
          ],
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black26),
              onPressed: () {})),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/71J-MFB-uQL._AC_SL1500_.jpg')))),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Smantha Tree',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Regular Price 195.00',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 13)),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "1",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(width: 150),
            Icon(
              Icons.star,
              color: Colors.orange[200],
            ),
            Icon(
              Icons.star,
              color: Colors.orange[200],
            ),
            Icon(
              Icons.star,
              color: Colors.orange[200],
            ),
            Icon(
              Icons.star,
              color: Colors.orange[200],
            ),
            Icon(
              Icons.star,
              color: Colors.orange[200],
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Text(
            "It is a long established fact that a reader will be distracted by the readable "
            "content of a page when looking at its layout. ",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 40),
          width: 340,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text(
            "Buy Now",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )),
        ),
      ]),
    );
  }
}
