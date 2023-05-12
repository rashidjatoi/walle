import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback ontap;
  const CustomButton({
    super.key,
    required this.btnText,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(color: customAppTheme),
      child: MaterialButton(
        onPressed: ontap,
        child: Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
