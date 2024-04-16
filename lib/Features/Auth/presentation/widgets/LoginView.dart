
import 'package:eye_cam_app/Features/Auth/presentation/AuthView.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:flutter/material.dart';

import 'TextFieldWidgets.dart';
import '../../../../core/Const/texts.dart';
import '../../../../core/settings/Settings.dart';
import '../../../../core/utils/sizeConfig.dart';
import '../../../../core/widgets/CustomButton.dart';
import '../../../../core/widgets/CustoumText.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key,required this.signupOnPressed});
  final VoidCallback signupOnPressed;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return
    SizedBox(
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: SizeConfig.defultSize! *5),
      
              Text(
                Texts().loginWelcome!,
                style: const TextStyle(fontSize: 32.7, fontWeight: FontWeight.bold,),
              ),
              Padding(padding: EdgeInsets.all(SizeConfig.defultSize! * 2)
                  ,child:Column(
                    crossAxisAlignment: Settings.isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
      
                      SizedBox(height: SizeConfig.defultSize! *5),
                      CustomTextField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: Texts().email!,
                        icon: const Icon(Icons.email),
                        text: Texts().email!,
                      ),
                      SizedBox(height: SizeConfig.defultSize! *5),
                      PasswordTextField(
                        controller: passwordController,
                        label: Texts().password!,
                        text: Texts().password!,
                        iconButton: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword ? Icons.visibility : Icons.visibility_off,
                          ),
                        ), obscurePassword: obscurePassword,
                      ),
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          "Forget password?",
                          style: const TextStyle(fontSize: 18, color: Colors.blue),
                          textDirection: Settings.isArabic ? TextDirection.rtl : TextDirection.ltr,
                        ),
                      ),
      
                      SizedBox(height: SizeConfig.defultSize! *8),
                      CustomGeneralButton(text: Texts().login!, onPressed: (){
                        AuthState.login(emailController.text,passwordController.text,context);
                      }),
                      SizedBox(height: SizeConfig.defultSize! *2),
                      TextBetweenLines(text: Settings.isArabic ? "او" : "OR",),
                      SizedBox(height: SizeConfig.defultSize! *2),
                      CustomGeneralButton(text: Texts().signup!, onPressed: widget.signupOnPressed),
                    ],))
      
            ],
          )
        ],
      ),
    )

      ;
  }
}
