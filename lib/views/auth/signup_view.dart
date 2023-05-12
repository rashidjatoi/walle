import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walle/controllers/auth_controller.dart';
import 'package:walle/services/services.dart';

import '../../components/components.dart';
import '../../constants/constants.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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

            // create account text
            const Text("Let's create your account",
                style: TextStyle(color: Colors.grey)),

            // sizebox height
            const SizedBox(height: 10),

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
                btnText: 'Sign Up',
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    Services.createUser(
                      authController.emailController.text,
                      authController.passwordController.text,
                    ).then((value) => Get.back());
                  }
                }),

            // Don't have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Get.back;
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
