// ignore_for_file: must_be_immutable

import 'package:eye_cam_app/core/settings/Settings.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.type,
      required this.label,
      required this.icon,
      required this.text});

  Widget icon;
  TextEditingController controller;
  var type;
  String label, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          Settings.isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.defultSize! * 2),
        TextField(
          controller: controller,
          textAlign: Settings.isArabic ? TextAlign.right : TextAlign.left,
          keyboardType: type,
          cursorColor: Colors.blue,
          style: const TextStyle(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.black,
            labelText: label,
            prefixIcon: icon,
          ),
        )
      ],
    );
  }
}

class PasswordTextField extends StatelessWidget {
  PasswordTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.iconButton,
      required this.text,
      required this.obscurePassword});
  Widget iconButton;
  TextEditingController controller;
  String label, text;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment:
          Settings.isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: SizeConfig.defultSize! * 2),
        TextField(
          controller: controller,
          textAlign: Settings.isArabic ? TextAlign.left : TextAlign.left,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Colors.blue,
          obscureText: obscurePassword,
          style: const TextStyle(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: iconButton,
            fillColor: Colors.black,
            labelText: label,
          ),
        ),
      ],
    );
  }
}
