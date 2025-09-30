import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String customLabel;
  final TextInputType customKeyboardType;
  final TextInputAction customTextInputAction;
  final Widget? customPrefixIcon;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.customKeyboardType,
    required this.customTextInputAction,
    required this.customPrefixIcon,
    required this.customLabel,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.customTextInputAction,
      keyboardType: widget.customKeyboardType,
      obscureText: widget.isPassword ? isObscureText : !isObscureText,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(widget.customLabel),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: widget.customPrefixIcon,
        prefixIconColor: AppColors.grey,
        suffixIconColor: AppColors.grey,
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: IconButton(
            onPressed: () {
              isObscureText = !isObscureText;
              setState(() {});
            },
            icon: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
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
