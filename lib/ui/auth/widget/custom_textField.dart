import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final String customLabel;
  final TextInputType customKeyboardType;
  final TextInputAction customTextInputAction;
  final Widget? customPrefixIcon;
  final TextEditingController controller;
  final bool isName;
  final bool isEmail;
  final bool isPhone;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.customKeyboardType,
    required this.customTextInputAction,
    required this.customPrefixIcon,
    required this.customLabel,
    required this.controller,
    this.isName = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? emailValidator(String? value) {
  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  // Basic email regex pattern for validation
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? phoneValidator(String? value) {
  final RegExp phoneRegex = RegExp(
    r'^\+?\d{1,3}?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$',
  );
  // Example regex for 11-12 digits, optional country code
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!phoneRegex.hasMatch(value)) {
    return 'Please enter valid phone number';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number';
  }
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  }
  return null;
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.customTextInputAction,
      keyboardType: widget.customKeyboardType,
      obscureText: widget.isPassword ? isObscureText : !isObscureText,
      validator: widget.isPassword
          ? (value) => passwordValidator(value)
          : widget.isEmail
          ? (value) => emailValidator(value)
          : widget.isPhone
          ? (value) => phoneValidator(value)
          : widget.isName
          ? (value) => nameValidator(value)
          : null,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(widget.customLabel),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: widget.customPrefixIcon,
        prefixIconColor: themeProvider.themeMode == ThemeMode.light
            ? AppColors.grey
            : AppColors.white,
        suffixIconColor: themeProvider.themeMode == ThemeMode.light
            ? AppColors.grey
            : AppColors.white,
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
          borderSide: BorderSide(
            color: themeProvider.themeMode == ThemeMode.light
                ? AppColors.grey
                : AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: themeProvider.themeMode == ThemeMode.light
                ? AppColors.grey
                : AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: themeProvider.themeMode == ThemeMode.light
                ? AppColors.grey
                : AppColors.white,
          ),
        ),
      ),
    );
  }
}
