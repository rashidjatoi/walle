import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walle/controllers/auth_controller.dart';

import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../services/services.dart';
import '../views.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("WALLE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Walle Image
            Image.asset(walle, height: 80),

            // Sizebox height
            const SizedBox(height: 40),

            Form(
              key: formKey,
              child: Column(
                children: [
                  // Email TextField
                  CustomTextField(
                    fieldText: 'Email',
                    textEditingController: authController.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),

                  // Sizebox height
                  const SizedBox(height: 10),

                  // Password TextField
                  CustomTextField(
                    fieldText: 'Password',
                    textEditingController: authController.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            // Sizebox height
            const SizedBox(height: 30),

            // Custom Button
            CustomButton(
              btnText: 'Sign In',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  Services.signInUser(
                    authController.emailController.text,
                    authController.passwordController.text,
                  ).then((value) => Get.offAll(() => const HomeView()));
                }
              },
            ),

            // Don't have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpView());
                    authController.dispose();
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: customAppTheme,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
