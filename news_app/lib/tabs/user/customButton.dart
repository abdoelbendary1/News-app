// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:news_app/appThem.dart';

class CustomButton extends StatelessWidget {
  double width;
  double hieght;
  String buttonText;
  IconData icon;
  Function()? onTap;
  CustomButton({
    required this.width,
    required this.hieght,
    required this.buttonText,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppTheme.greyLighter,
          foregroundColor: AppTheme.greyDarker,
          minimumSize: Size(width, hieght)),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            Icon(
              icon,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
