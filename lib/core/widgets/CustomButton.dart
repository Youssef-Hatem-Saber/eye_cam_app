// ignore_for_file: must_be_immutable

import 'package:eye_cam_app/core/settings/Settings.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomGeneralButton extends StatelessWidget {

  CustomGeneralButton({super.key, required this.text, required this.onPressed});
  String text;
  VoidCallback onPressed;
  bool isArabic = Settings.language == "Arabic" ? true : false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(

          height: 50,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(

            child: Text(

              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
          ),
        ));
  }
}



class CustomButtonTwoText extends StatelessWidget {

  CustomButtonTwoText({super.key, required this.text, required this.onPressed, required this.subText});
  final String text,subText;
  final VoidCallback onPressed;
  final bool isArabic = Settings.language == "Arabic" ? true : false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(

          height: SizeConfig.defultSize! * 50,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(

            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                Text(
                  subText,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
              ],
            ),
          ),
        ));
  }
}





class CustomButtonAndIcon extends StatelessWidget {
  CustomButtonAndIcon({super.key, required this.text, required this.onPressed,required this.icon});
  String text;
  final icon;
  VoidCallback onPressed;
  bool isArabic = Settings.language == "Arabic" ? true : false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
      height: SizeConfig.defultSize! * 50,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Center(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: SizeConfig.defultSize! *2),
            Text(

              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
          ],
        ),
      ),
    ));
  }
}
