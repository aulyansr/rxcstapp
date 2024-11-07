import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/welcome/views/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class OnboardingScreenContent {
  String titleRow1;
  String titleRow2;
  String image;
  OnboardingScreenContent(
      {required this.titleRow1, required this.titleRow2, required this.image});
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentPageViewIndex = 0;
  List<OnboardingScreenContent> contents = [
    OnboardingScreenContent(
        titleRow1: "Banyak duduk bikin",
        titleRow2: "badan capek dan pegal?",
        image: "assets/images/onboarding1.png"),
    OnboardingScreenContent(
        titleRow1: "Kalau dibiarin",
        titleRow2: "bisa ganggu produktivitas",
        image: "assets/images/onboarding2.png"),
    OnboardingScreenContent(
        titleRow1: "Mending",
        titleRow2: "#RelaxAjaDulu",
        image: "assets/images/onboarding3.png")
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (idx) {
                      setState(() {
                        currentPageViewIndex = idx;
                      });
                    },
                    itemCount: contents.length,
                    itemBuilder: (_, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            contents[i].titleRow1,
                            style: AppStyles.onboardingTitle,
                          ),
                          Text(contents[i].titleRow2,
                              style: AppStyles.onboardingTitle),
                          SizedBox(height: 50),
                          SizedBox(
                            width: double.infinity,
                            height: 400,
                            child: Image.asset(
                              contents[i].image,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        ],
                      );
                    })),
            Container(
                padding: const EdgeInsets.only(top: 0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        contents.length, (index) => generateDots(index))
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: LayoutBuilder(builder: (context, constraints) {
                  if (currentPageViewIndex < 2) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const WelcomeScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Lewati",
                                style: TextStyle(
                                    color: AppStyles.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeInOut);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 25, right: 25, bottom: 10),
                            child: Text("Lanjut",
                                style: TextStyle(
                                    color: AppStyles.whiteColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  AppStyles.primaryColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(0),
                                          bottomRight: Radius.circular(0))))),
                        )
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const WelcomeScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Mulai Sekarang",
                              style: TextStyle(
                                  color: AppStyles.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppStyles.primaryColor),
                            minimumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 10)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                      ),
                    );
                  }
                }))
          ],
        ),
      );
    }));
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Column(
  //     children: [
  //       Expanded(
  //         child: Container(
  //             child: PageView.builder(
  //                 controller: _pageController,
  //                 onPageChanged: (idx) {
  //                   setState(() {
  //                     currentPageViewIndex = idx;
  //                   });
  //                 },
  //                 itemCount: contents.length,
  //                 itemBuilder: (_, i) {
  //                   return Padding(
  //                     padding: const EdgeInsets.all(20),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           contents[i].titleRow1,
  //                           style: AppStyles.onboardingTitle,
  //                         ),
  //                         Text(contents[i].titleRow2,
  //                             style: AppStyles.onboardingTitle),
  //                         SizedBox(height: 50),
  //                         SvgPicture.asset(contents[i].image)
  //                       ],
  //                     ),
  //                   );
  //                 })),
  //       ),
  //       Container(
  //           padding: const EdgeInsets.only(top: 0, bottom: 40),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               ...List.generate(
  //                   contents.length, (index) => generateDots(index))
  //             ],
  //           )),
  //       Container(
  //           padding: const EdgeInsets.only(bottom: 60),
  //           child: LayoutBuilder(builder: (context, constraints) {
  //             if (currentPageViewIndex < 2) {
  //               return Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                           builder: (_) => const WelcomeScreen()));
  //                     },
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(10),
  //                       child: Text("Lewati",
  //                           style: TextStyle(
  //                               color: AppStyles.primaryColor,
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold)),
  //                     ),
  //                   ),
  //                   TextButton(
  //                     onPressed: () {
  //                       _pageController.nextPage(
  //                           duration: Duration(milliseconds: 100),
  //                           curve: Curves.easeInOut);
  //                     },
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 10, left: 25, right: 25, bottom: 10),
  //                       child: Text("Lanjut",
  //                           style: TextStyle(
  //                               color: AppStyles.whiteColor,
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold)),
  //                     ),
  //                     style: ButtonStyle(
  //                         backgroundColor:
  //                             WidgetStatePropertyAll(AppStyles.primaryColor),
  //                         shape: WidgetStatePropertyAll(RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(10),
  //                                 bottomLeft: Radius.circular(10),
  //                                 topRight: Radius.circular(0),
  //                                 bottomRight: Radius.circular(0))))),
  //                   )
  //                 ],
  //               );
  //             } else {
  //               return Padding(
  //                 padding: const EdgeInsets.only(left: 20, right: 20),
  //                 child: TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                         builder: (_) => const WelcomeScreen()));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(10),
  //                     child: Text("Mulai Sekarang",
  //                         style: TextStyle(
  //                             color: AppStyles.whiteColor,
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.bold)),
  //                   ),
  //                   style: ButtonStyle(
  //                       backgroundColor:
  //                           WidgetStatePropertyAll(AppStyles.primaryColor),
  //                       minimumSize:
  //                           WidgetStatePropertyAll(Size(double.infinity, 10)),
  //                       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
  //                           borderRadius:
  //                               BorderRadius.all(Radius.circular(10))))),
  //                 ),
  //               );
  //             }
  //           }))
  //     ],
  //   ));
  // }

  Container generateDots(int idx) {
    return Container(
      height: 10,
      width: idx == currentPageViewIndex ? 26 : 10,
      margin: const EdgeInsets.only(left: 2.5, right: 2.5),
      decoration: BoxDecoration(
          color: idx == currentPageViewIndex
              ? AppStyles.primaryColor
              : AppStyles.mutedColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
