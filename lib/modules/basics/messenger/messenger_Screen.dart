import 'package:flutter/material.dart';

class FaceScreen extends StatelessWidget {
  const FaceScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: Colors.white,
                  )),
              onPressed: () {}),
          IconButton(
              icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  )),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'searsh',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildStoryItem(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                itemCount: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => buildChatItem(),
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: 10,
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ahmed elmasry elmasry ahmed elmasry elmasry ahmed elmasry elmasry',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      'عامل اي يهندسه ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '12:00',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      );
  Widget buildStoryItem() => Container(
      width: 60,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'Ahmed Almasry ',
            style: TextStyle(color: Colors.white, fontSize: 15),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ));
}
