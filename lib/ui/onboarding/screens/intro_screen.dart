import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/onboarding/models/intro_screen.dart';
import 'package:evently/core/utils/app_assets.dart';
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLoginScreen() {
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    bool isFirstPage = currentPageIndex == 0;
    bool isLastPage = currentPageIndex == IntroDetails.introDetails.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logo, width: 160),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: IntroDetails.introDetails.length,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPageIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  final IntroDetails currentDetail =
                      IntroDetails.introDetails[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Image.asset(currentDetail.imagePath)),
                      Text(
                        currentDetail.getLocalizedTitle(context),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        currentDetail.getLocalizedSubtitle(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  );
                },
              ),
            ),
            Visibility(
              visible: !isLastPage,
              child: TextButton(
                onPressed: _navigateToLoginScreen,
                child: Text(
                  locale.skip,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: AppColors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(Icons.arrow_back_outlined),
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
                            ? _navigateToLoginScreen()
                            : _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                      },
                      icon: const Icon(Icons.arrow_forward_outlined),
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
