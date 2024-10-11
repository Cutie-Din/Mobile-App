import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/onboarding_page.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/constants/image_strings.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _isLoading = true; // Biến để theo dõi trạng thái tải

  @override
  void initState() {
    super.initState();
    _checkIfOnboardingSeen();
  }

  Future<void> _checkIfOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    if (seenOnboarding) {
      // Nếu người dùng đã xem onboarding, chuyển hướng sang màn hình đăng nhập
      Navigator.pushReplacementNamed(context, '/sign-in');
    } else {
      // Nếu chưa xem, cho phép hiển thị onboarding
      setState(() {
        _isLoading = false; // Đặt _isLoading thành false để hiển thị onboarding
      });
    }
  }

  Future<void> _setOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Hiển thị một vòng xoay chờ trong khi kiểm tra
      return Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(), // Hoặc bất kỳ widget nào bạn muốn hiển thị trong lúc chờ
        ),
      );
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe navigation
        children: [
          OnboardingPage(
            description: AppText.ob_1,
            gifFile: AppImg.onboarding_1,
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            isLastPage: false,
          ),
          OnboardingPage(
            description: AppText.ob_2,
            gifFile: AppImg.onboarding_2,
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            isLastPage: false,
          ),
          OnboardingPage(
            description: AppText.ob_3,
            gifFile: AppImg.onboarding_3,
            onNext: () async {
              // Khi người dùng hoàn thành onboarding, lưu trạng thái và chuyển hướng
              await _setOnboardingSeen();
              Navigator.pushReplacementNamed(context, '/sign-in');
            },
            isLastPage: true,
          ),
        ],
      ),
    );
  }
}
