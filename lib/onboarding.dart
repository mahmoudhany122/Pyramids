import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyramids/sign.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(image: 'assets/images/shop1665463624.png', title: "Hello in our Chat-Bot AI app", body: ""),
    BoardingModel(image: 'assets/images/R.png', title: "Examine your self now", body: ''),
  ];

  var boardController = PageController();
  bool Islast = false;

  double get radius => 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => BuildBoardingItem(
                  boarding[index],
                ),
                physics: const RangeMaintainingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      Islast = true;
                    });
                    print('last index');
                  } else {
                    setState(() {
                      Islast = false;
                    });
                    print("is not last");
                  }
                },
                controller: boardController,
                itemCount: boarding.length,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>ResighterScreen(),
                  ),
                );

              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(radius),
                    color: Colors.blueGrey[300]
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: boardController,
              effect: ExpandingDotsEffect(
                dotColor: Colors.black26,
                activeDotColor: Colors.black54,
                dotHeight: 12,
                expansionFactor: 4,
                dotWidth: 4,
                spacing: 5,
              ),
              count: boarding.length,
            ),
            Row(
              children: [
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (Islast) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>ResighterScreen(),
                          ));
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 700,
                        ),
                        curve: Curves.easeInToLinear,
                      );

                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Center(
        child: Text(
          '${model.title}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Center(
        child: Text(
          '${model.body}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    ],
  );
}
