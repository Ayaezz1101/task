import 'package:flutter/material.dart';
import 'package:task1/routing/spring_route.dart';
import 'package:task1/widgets/app_button.dart';
import 'package:task1/widgets/app_circle.dart';
import 'sign_up.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_password_field.dart';
import '../theme/app_theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double getRelativeWidth(double pix) => (pix / 345) * screenWidth;

    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: getRelativeWidth(25)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                AppCircleButton(
                  onTap: () => Navigator.pop(context),
                  icon: Icons.arrow_back_ios_new,
                ),
                const SizedBox(height: 24),

                Text(
                  "Hey,\nWelcome Back",
                  style: AppTextStyles.title.copyWith(height: 1.1),
                ),

                const SizedBox(height: 56),

                AppTextField(
                  controller: emailController,
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Email is required";
                    if (!value.contains('@')) return "Enter a valid email";
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                AppPasswordField(
                  controller: passwordController,
                  hint: "Enter your password",
                  obscure: obscure,
                  validator: (value) {
                    if (value == null || value.length < 6)
                      return "Min 6 characters";
                    return null;
                  },
                  onTap: () => setState(() => obscure = !obscure),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.15),

                AppPrimaryButton(
                  text: "Login",
                  height: 48,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Logging in...");
                    }
                  },
                ),

                const SizedBox(height: 16),

                Center(
                  child: Text("Or Continue with", style: AppTextStyles.body),
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIconAsset('assets/images/Social Icons (1).png'),
                    const SizedBox(width: 16),
                    _socialIconAsset('assets/images/Social Icons (2).png'),
                    const SizedBox(width: 16),
                    _socialIconAsset('assets/images/Social Icons.png'),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: AppTextStyles.body,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SpringPageRoute(page: const SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: AppTextStyles.body.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIconAsset(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}
