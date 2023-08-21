import '../../common/constants.dart';
import '/screens/onboard/welcome_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/on-boarding';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  int page = 0;

  final List pageArr = [
    {
      "title": "Discounted\nSecondhand Books",
      "sub_title": "Used and near new secondhand books at great prices.",
      "img": "assets/img/on_1.png"
    },
    {
      "title": "20 Book Grocers\nNationally",
      "sub_title": "We've successfully opened 20 stores across Australia.",
      "img": "assets/img/on_2.png"
    },
    {
      "title": "Sell or Recycle Your Old\nBooks With Us",
      "sub_title":
          "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
      "img": "assets/img/on_3.png"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    pageController.addListener(() {
      page = pageController.page!.round();
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: pageArr.length,
              itemBuilder: (context, index) => SizedBox(
                width: size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pageArr[index]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        pageArr[index]['sub_title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.primaryLight,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.25,
                      ),
                      Image.asset(
                        pageArr[index]['img'],
                        width: size.width * 0.8,
                        height: size.width * 0.8,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              width: size.width * 0.9,
              left: size.width * 0.05,
              bottom: size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        if (page < 2) {
                          page += 1;
                          pageController.jumpToPage(page);
                        }
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          pageArr.length,
                          (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    color: page == index
                                        ? TColor.primary
                                        : TColor.primaryLight,
                                    borderRadius: BorderRadius.circular(7.5)),
                              ))
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        if (page < 2) {
                          page += 1;
                          pageController.jumpToPage(page);
                        } else {
                          Navigator.pushReplacementNamed(
                              context, WelcomeScreen.routeName);
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
