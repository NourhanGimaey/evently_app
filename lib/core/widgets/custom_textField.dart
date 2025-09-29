import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String customHintText;
  final TextInputType customKeyboardType;
  final TextInputAction customTextInputAction;
  final Widget? cistomPrefixIcon;
  const CustomTextField({
    super.key,
    required this.customHintText,
    required this.customKeyboardType,
    required this.customTextInputAction,
    required this.cistomPrefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: customTextInputAction,
      keyboardType: customKeyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: customHintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: cistomPrefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grey),
        ),
      ),
    );
  }
}
