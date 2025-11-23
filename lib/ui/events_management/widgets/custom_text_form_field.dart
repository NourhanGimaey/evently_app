import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxLines;
  final Widget? prefixIcon;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFormField({super.key, this.maxLines, this.prefixIcon, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: AppColors.grey),
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.blue, width: 1.0),
        ),
      ),
    );
  }
}
