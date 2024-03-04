import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/appThem.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixicon,
    this.obscure = false,
    required this.controller,
  });
  String hintText;
  TextEditingController controller = TextEditingController();
  Widget? suffixIcon;
  Widget? prefixicon;
  bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        focusColor: AppTheme.greyDarker,
        prefixIcon: prefixicon,
        filled: true,
        fillColor: AppTheme.greyLighter,
        hintText: hintText,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppTheme.purplePrimary,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
