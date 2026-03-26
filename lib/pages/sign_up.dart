import 'package:flutter/material.dart';
import 'package:task1/pages/home.dart';
import 'package:task1/pages/sign_in.dart';
import 'package:task1/routing/spring_route.dart';
import 'package:task1/widgets/app_button.dart';
import 'package:task1/widgets/app_circle.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_password_field.dart';
import '../theme/app_theme.dart';
import '../../services/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final AuthService _auth = AuthService();

  bool obscure1 = true;
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double getRelativeWidth(double pix) => (pix / 345) * screenWidth;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: getRelativeWidth(25)),
          child: Form(
            key: _signUpKey,
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
                  "Let's, Create\nAccount",
                  style: AppTextStyles.title.copyWith(height: 1.1),
                ),

                const SizedBox(height: 56),

                AppTextField(
                  controller: emailController,
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                  validator: (value) => (value == null || !value.contains('@'))
                      ? "Invalid email"
                      : null,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: phoneController,
                  hint: "Enter your number",
                  icon: Icons.phone_android,
                  validator: (value) => (value == null || value.length < 10)
                      ? "Invalid number"
                      : null,
                ),
                const SizedBox(height: 16),

                AppPasswordField(
                  controller: passwordController,
                  hint: "Enter your password",
                  obscure: obscure1,
                  validator: (value) =>
                      (value == null || value.length < 6) ? "Too short" : null,
                  onTap: () => setState(() => obscure1 = !obscure1),
                ),
                const SizedBox(height: 16),

                AppPasswordField(
                  controller: confirmController,
                  hint: "Confirm your password",
                  obscure: obscure2,
                  validator: (value) {
                    if (value != passwordController.text)
                      return "Passwords don't match";
                    return null;
                  },
                  onTap: () => setState(() => obscure2 = !obscure2),
                ),

                SizedBox(height: screenHeight * 0.1),

                AppPrimaryButton(
                  text: "Create Account",
                  onPressed: () async {
                    if (_signUpKey.currentState!.validate()) {
                      
                      try {
                        await _auth.signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                ),
                const SizedBox(height: 10),

                const Center(
                  child: Text("Or Continue with", style: AppTextStyles.body),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: AppTextStyles.body,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SpringPageRoute(page: const SignIn()),
                        );
                      },
                      child: Text(
                        "Sign-In",
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
}
