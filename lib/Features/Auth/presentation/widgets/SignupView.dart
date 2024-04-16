
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../core/Const/texts.dart';
import '../../../../core/settings/Settings.dart';
import '../../../../core/utils/sizeConfig.dart';
import '../../../../core/widgets/CustomButton.dart';
import '../../../../core/widgets/CustoumText.dart';
import 'TextFieldWidgets.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key,required this.loginOnPressed});
  final VoidCallback loginOnPressed;
  @override
  State<SignupView> createState() => _SignupViewState();
}
class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),nameController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return

Column(
        children: [
          SizedBox(height: SizeConfig.defultSize! *4),

          Text(
            Texts().signupWelcome
            !,
            style: const TextStyle(fontSize: 32.7, fontWeight: FontWeight.bold,),
          ),
          Padding(padding: EdgeInsets.all(SizeConfig.defultSize! * 2)
              ,child:Column(
                crossAxisAlignment: Settings.isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [

                  SizedBox(height: SizeConfig.defultSize! *3),
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
                  SizedBox(height: SizeConfig.defultSize! *5),
                  CustomTextField(
                    controller: nameController,
                    type: TextInputType.name,
                    label: Texts().name!,
                    icon: const Icon(Icons.email),
                    text: Texts().name!,
                  ),
                  SizedBox(height: SizeConfig.defultSize! *5),
                  CustomGeneralButton(text: Texts().signup!, onPressed: (){
                    AuthState.signup(emailController.text, passwordController.text, nameController.text,context);
                  }),
                  SizedBox(height: SizeConfig.defultSize! *2),
                  TextBetweenLines(text: Settings.isArabic ? "او" : "OR",),
                  SizedBox(height: SizeConfig.defultSize! *1),
                  CustomGeneralButton(text: Texts().login!, onPressed: widget.loginOnPressed),

                ],))

        ],
      )

      ;
  }
}
