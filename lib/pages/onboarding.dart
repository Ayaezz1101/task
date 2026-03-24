import 'package:flutter/material.dart';
import 'package:task1/routing/spring_route.dart';
import 'package:task1/widgets/app_button.dart';
import 'package:task1/widgets/app_skip_button.dart';
import 'package:task1/widgets/indicator_widget.dart';
import 'sign_in.dart';
import '../theme/app_theme.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double getRelativeWidth(double pix) => (pix / 345) * screenWidth;
    double getRelativeHeight(double pix) => (pix / 812) * screenHeight;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, right: getRelativeWidth(25)),
              child: Align(
                alignment: Alignment.topRight,
                child: AppskipButton(
                  text: "Skip",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignIn()),
                    );
                  },
                ),
              ),
            ),

            const Spacer(),
            SizedBox(
              width: getRelativeWidth(256),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/young boys and young girl jumping.png',
                    width: getRelativeWidth(256),
                    height: getRelativeHeight(350),
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 32),
                  SizedBox(
                    height: 74,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyles.title.copyWith(
                              fontSize: 24,
                              height: 1.4,
                            ),

                            children: [
                              TextSpan(text: "Welcome to App"),
                              TextSpan(
                                text: "Name",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, adipiscing elit. Volupta consectetur adipisicing.",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body.copyWith(height: 1.1),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IndicatorWidget(
                        width: 8,
                        color: AppColors.indicatorInactive,
                      ),
                      const SizedBox(width: 8),
                      IndicatorWidget(
                        width: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      IndicatorWidget(
                        width: 10,
                        color: AppColors.indicatorInactive,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AppPrimaryButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    SpringPageRoute(page: const SignIn()),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
