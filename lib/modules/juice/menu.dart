import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black), onPressed: null),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 5,
            ),
            child: Container(
              margin: EdgeInsets.all(14),
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Center(
                  child: Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              )),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 90,
                      width: 90,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.red, blurRadius: 3)
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS-dD_9OwwMefgfA6r-P5g5LAa4K-HpOpSVIQ&usqp=CAU'),
                            fit: BoxFit.cover),
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 30),
            child: SizedBox(
              height: 20,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        'Apple',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.veggieinspired.com/wp-content/uploads/2018/01/strawberry-beet-smoothie-2-1-735x1103.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 335, right: 25),
                              child: Text(
                                'Strawberry Smoonthie',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, right: 130),
                              child: Text(
                                '\$ 7.55',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              margin: EdgeInsets.only(left: 170),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.pink[300],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.view_module,
                    color: Colors.orange[300],
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  )),
                ),
                IconButton(
                  icon: Icon(
                    Icons.network_cell,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
