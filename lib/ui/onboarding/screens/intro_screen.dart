import 'package:evently/core/models/intro_screen.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isFirstPage = currentPageIndex == 0;
    bool isLastPage = currentPageIndex == IntroDetails.introDetails.length - 1;
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppImages.logo, width: 160)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: IntroDetails.introDetails.length,
                controller: _pageController,
                onPageChanged: (value) {
                  currentPageIndex = value;
                  currentPageIndex = _pageController.page!.round();
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          IntroDetails.introDetails[index].imagePath,
                        ),
                      ),
                      Text(
                        IntroDetails.introDetails[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 16),
                      Text(
                        IntroDetails.introDetails[index].subtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !isFirstPage,
                    child: CircleAvatar(
                      backgroundColor: AppColors.blue,
                      foregroundColor: AppColors.white,
                      child: IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(Icons.arrow_back_outlined),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: IntroDetails.introDetails.length,
                    effect: const WormEffect(
                    dotColor: AppColors.blue,
                    activeDotColor: AppColors.black,
                    dotWidth: 7,
                    dotHeight: 7,
                  ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    child: IconButton(
                      onPressed: () {
                        isLastPage
                      ? Navigator.pushNamed(context, AppRoutes.loginScreen.routeName)
                      : _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
