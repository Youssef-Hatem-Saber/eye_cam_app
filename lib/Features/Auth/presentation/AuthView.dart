
import 'package:eye_cam_app/Features/Auth/presentation/widgets/LoginView.dart';
import 'package:eye_cam_app/Features/Auth/presentation/widgets/SignupView.dart';
import 'package:eye_cam_app/Features/Auth/presentation/widgets/jopForm.dart';
import 'package:eye_cam_app/Features/HomePage/presentation/HomePageView.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/generated/assets.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  AuthView({super.key});
  static Route route(){
    return MaterialPageRoute(builder: (_) => AuthView());
  }
  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isNewUser = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Assets.imagesBackground), fit: BoxFit.fill),
        ),
        child:
        SafeArea(
          child: isNewUser ?
          AuthState.isHelper ? JobApplicationFormFields() :
          SignupView(loginOnPressed: () {
            setState(() {
              isNewUser = false;
            });
          },) : LoginView( signupOnPressed: () {
            setState(() {
            isNewUser = true;
          });}
          ,         ),
)


      ),
    );
  }
}
