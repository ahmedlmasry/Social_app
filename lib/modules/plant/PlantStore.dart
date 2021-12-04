import 'package:flutter/material.dart';

class PlantStore extends StatefulWidget {
  @override
  _PlantStoreState createState() => _PlantStoreState();
}

class _PlantStoreState extends State<PlantStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Text(
                "What Kind",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Of Plants you Want",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "Search..",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.mic_none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Small",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Medium",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Hanging",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Container(
                      height: 220,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "indoor",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.grey[400],
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                'https://target.scene7.com/is/image/Target/GUEST_eac6ee44-9f19-4e93-8c1c-b65f91190be1'),
                          )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    "Ficas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "From \$12",
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[400],
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ])),
                  SizedBox(
                    width: 35,
                  ),
                  Container(
                    height: 220,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "indoor",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.grey[400],
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images-na.ssl-images-amazon.com/images/I/31ObZlsiXJL.jpg')))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    "Cactues",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "From \$12",
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[400],
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  Container(
                      height: 220,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "indoor",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.grey[400],
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRvQS39rJIh5DXfWVUC6jETuOai-cPQZPrqWw&usqp=CAU'))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    "Smantha",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "From \$12",
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[400],
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ])),
                  SizedBox(
                    width: 35,
                  ),
                  Container(
                    height: 220,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "indoor",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.grey[400],
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT3Gv0MZBxtUr0WJdq9FbSJQl5w9fhUnzDuQA&usqp=CAU'))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    "Alovera",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "From \$12",
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[400],
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
