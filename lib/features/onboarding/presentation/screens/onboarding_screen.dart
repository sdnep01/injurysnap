import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';
import 'package:injurysnap/features/auth/presentation/screens/login_screen.dart';
import 'package:injurysnap/features/onboarding/domain/models/onboarding_data.dart';
import 'package:injurysnap/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      stepTitle: 'SNAP',
      stepNumber: 1,
      topIcon: FontAwesomeIcons.camera,
      title: 'Take a Photo of Your Injury',
      description:
          'Capture a clear image of the affected area. Our AI will analyze the visual signs to help understand your injury better.',
      items: [
        OnboardingItem(
          text: 'Good lighting & clear angle',
          icon: FontAwesomeIcons.check,
        ),
        OnboardingItem(
          text: 'Remove clothing if necessary',
          icon: FontAwesomeIcons.check,
        ),
        OnboardingItem(
          text: 'Upload from gallery if needed',
          icon: FontAwesomeIcons.check,
        ),
      ],
    ),
    OnboardingData(
      stepTitle: 'ASSESS',
      stepNumber: 2,
      topIcon: FontAwesomeIcons.clipboardList,
      title: 'Answer Simple Questions',
      description:
          'Tell us about your pain level, mobility, and symptoms. This helps our assessment algorithm provide accurate insights.',
      items: [
        OnboardingItem(
          text: 'Select Body Part',
          icon: FontAwesomeIcons.childReaching,
        ), // Approx icon
        OnboardingItem(
          text: 'Describe Pain Type',
          icon: FontAwesomeIcons.hand,
        ), // Approx icon
        OnboardingItem(
          text: 'Pain Intensity Level',
          icon: FontAwesomeIcons.gaugeHigh,
        ), // Approx icon
      ],
    ),
    OnboardingData(
      stepTitle: 'ACT',
      stepNumber: 3,
      topIcon: FontAwesomeIcons.heartPulse,
      title: 'Get Personalized Plan',
      description:
          'Receive tailored recommendations based on your assessment. From self-care tips to finding the right healthcare provider.',
      items: [
        OnboardingItem(
          text: 'Self-Care (if mild)',
          icon: FontAwesomeIcons.house,
          iconColor: AppColors.primary,
        ),
        OnboardingItem(
          text: 'Find Specialist',
          icon: FontAwesomeIcons.userDoctor,
          iconColor: AppColors.warning,
        ),
        OnboardingItem(
          text: 'Emergency Care',
          icon: FontAwesomeIcons.hospital,
          iconColor: AppColors.error,
        ),
      ],
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentData = _pages[_currentPage];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: _prevPage,
                      child: Text(
                        'Prev',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 48), // Spacer to maintain alignment

                  if (_currentPage < _pages.length - 1)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 48),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Top Content (Icon + Step Box) - AnimatedSwitcher for smooth transition
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      currentData.topIcon,
                      key: ValueKey<int>(_currentPage),
                      size: 64,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      key: ValueKey<int>(_currentPage),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentData.stepTitle,
                            style: GoogleFonts.outfit(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Step ${currentData.stepNumber} of 3',
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Pagination Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == _currentPage ? 24 : 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: index == _currentPage
                        ? AppColors.primary
                        : Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Card Content (PageView)
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingCard(data: _pages[index]);
                },
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
