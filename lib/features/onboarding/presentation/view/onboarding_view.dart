import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constant/color.dart';

import '../../../../core/helper_widgets/custom_button.dart';
import '../../../../core/helpers_classes/cached_helper.dart';
import '../../../auth/presentation/view/login_view.dart';
import '../widgets/onboarding_slider.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: OnBoardingSlider(
            pageController: _pageController,
            currentIndex: _currentIndex,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Expanded(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: onboardingPages.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColor.primaryColor,
              dotColor: AppColor.grey,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 3,
              spacing: 5.0,
            ),
          ),
        ),
        CustomButton(
          title: 'Continue',
          onPressed: () {
            if (_currentIndex == onboardingPages.length - 1) {
              CachedHelper.saveCachedData(key: 'isSeen', value: true);
              Get.off(() => LoginView());
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              );
            }
          },
          btnColor: AppColor.primaryColor,
          txtColor: Colors.white,
          fontSize: 20,
        ),
        CustomButton(
          elevation: 0,
          title: 'Skip',
          onPressed: () {
            CachedHelper.saveCachedData(key: 'isSeen', value: true);
            Get.off(() => LoginView());
          },
          btnColor: Colors.white,
          txtColor: AppColor.primaryColor,
          fontSize: 16,
        ),
      ],
    ));
  }
}
