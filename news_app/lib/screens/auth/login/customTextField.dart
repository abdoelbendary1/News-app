import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/appThem.dart';

typedef myValidator = String? Function(String?);

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.keybaordType = TextInputType.text});
  String hintText;
  TextInputType keybaordType;
  myValidator validator;

  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(
        color: AppTheme.blackDarker,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          filled: true,
          fillColor: AppTheme.greyDarker.withOpacity(0.2),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppTheme.redColor),
              borderRadius: BorderRadius.circular(18)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppTheme.redColor),
              borderRadius: BorderRadius.circular(18)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppTheme.blackDarker),
              borderRadius: BorderRadius.circular(18)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: AppTheme.blackDarker),
              borderRadius: BorderRadius.circular(18))),
      controller: controller,
    );
  }
}
