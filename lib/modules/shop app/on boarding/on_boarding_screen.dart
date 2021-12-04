import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groub/modules/shop%20app/shop%20login/shop_login_screen.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/network/local/cache_helper.dart';
import 'package:groub/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.body,
    required this.title,
    required this.image,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard_1.png',
      title: ' on board 1 title',
      body: 'on board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/onboard_1.png',
      title: ' on board 2 title',
      body: 'on board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/onboard_1.png',
      title: ' on board 3 title',
      body: 'on board 3 body',
    )
  ];
  bool? isLast = false;
  void submit() {
    CacheHelper.saveData(value: true, key: 'onBoarding').then((value) {
      navigateAndFinish(context, ShopLoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(function: submit, text: 'skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else
                    setState(() {
                      isLast = false;
                    });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultcolor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 30,
          ),
          Text(
            ' ${model.title}',
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.body}',
          ),
        ],
      );
}
