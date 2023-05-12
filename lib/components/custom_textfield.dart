import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String fieldText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.fieldText,
    required this.textEditingController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: fieldText,
            border: InputBorder.none,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
