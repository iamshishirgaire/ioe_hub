import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/animated_widget.dart';
import 'package:ioe_hub/features/onboarding/widgets/onboarding.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'I O E  H U B',
      'subtitle': 'W E L C O M E',
      'imageAsset': 'assets/logo/icon_dark.png',
      'type': "png"
    },
    {
      'title': 'Syllabus',
      'subtitle': 'Explore the extended catalogue of syllabus',
      'imageAsset': 'assets/icons/syllabus.svg',
      'type': "svg"
    },
    {
      'title': 'Prepare for exams',
      'subtitle': 'View all of our past questions collections',
      'imageAsset': 'assets/icons/paper.svg',
      'type': "svg"
    },
    {
      'title': 'Share and find notes',
      'subtitle': 'Share and find amazing collection of notes',
      'imageAsset': 'assets/icons/note.svg',
      'type': "svg"
    },
  ];

  void _onNextPressed() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      AutoRouter.of(context)
          .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
    }
  }

  void _onSkipPressed() {
    AutoRouter.of(context)
        .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => _buildIndicator(index == _currentPage),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: _onSkipPressed,
            child: Text('Skip',
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              final data = _onboardingData[index];
              return OnboardingWidget(
                title: data['title']!,
                subtitle: data['subtitle']!,
                imageAsset: data['imageAsset']!,
                type: data['type']!,
              );
            },
          ),
          Positioned(
            bottom: 60,
            right: 130,
            child: _currentPage != 0
                ? IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(Iconsax.arrow_left_2),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 60,
            right: 20,
            child: FadeInWidget(
              child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  onPressed: _onNextPressed,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  icon: Text(
                    _currentPage == _onboardingData.length - 1
                        ? 'Finish'
                        : ' Next ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 20.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
