import 'package:flutter/material.dart';
import 'package:groub/modules/resturant/resturant_second.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Hi Ahmed',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Searsh Food',
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Specials',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return Container(
                        height: 270,
                        width: 150,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-photo/top-view-delicious-pizza_23-2148570346.jpg?size=626&ext=jpg&ga=GA1.2.398855228.1603234672'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ));
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50),
            child: Row(
              children: [
                Text(
                  'Menus',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://img.freepik.com/free-photo/mixed-pizza-with-sliced-lemon_140725-2808.jpg?size=626&ext=jpg&ga=GA1.2.398855228.1603234672'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dosa',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '2.207 votes',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Text('\$ 50.00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
