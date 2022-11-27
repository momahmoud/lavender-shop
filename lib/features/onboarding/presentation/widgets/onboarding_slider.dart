import 'package:flutter/material.dart';

import '../../../../core/constant/image_consts.dart';
import '../../models/onboarding_model.dart';

class OnBoardingSlider extends StatelessWidget {
  final PageController? pageController;
  final int currentIndex;
  final Function onPageChanged;
  const OnBoardingSlider(
      {Key? key,
      required this.pageController,
      required this.currentIndex,
      required this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        onPageChanged(index);
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 50),
            Text(
              onboardingPages[index].title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // fontFamily: 'PlayfairDisplay',
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                onboardingPages[index].image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Text(
                onboardingPages[index].body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  // fontFamily: 'Cairo',
                  height: 1.3,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

List<OnBoardingModel> onboardingPages = [
  OnBoardingModel(
    title: 'Choose Product',
    image: ImageConstant.onBoardingImageOne,
    body:
        'We Have a 100k Product, Choose \n Your Product From Our E-commerce Shop',
  ),
  OnBoardingModel(
    title: 'Easy And Safe Payment',
    image: ImageConstant.onBoardingImageTwo,
    body:
        'We Have a 100k Product, Choose \n Your Product From Our E-commerce Shop',
  ),
  OnBoardingModel(
    title: 'Track Your Order',
    image: ImageConstant.onBoardingImageThree,
    body:
        'We Have a 100k Product, Choose \n Your Product From Our E-commerce Shop',
  ),
];
