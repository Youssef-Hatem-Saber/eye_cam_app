import 'package:cherry_toast/cherry_toast.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/Const/texts.dart';
import '../../../../core/settings/Settings.dart';
import '../../../../core/utils/sizeConfig.dart';
import '../../../../core/widgets/CustomButton.dart';
import '../../../../core/widgets/CustoumText.dart';
import 'TextFieldWidgets.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key, required this.loginOnPressed});
  final VoidCallback loginOnPressed;

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController();
  bool obscurePassword = true;
  bool male = false, female = false;
  String selectedPlan = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.defultSize! * 4),
          Text(
            Texts().signupWelcome!,
            style: const TextStyle(
              fontSize: 32.7,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
            child: Column(
              crossAxisAlignment: Settings.isArabic
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defultSize! * 3),
                CustomTextField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: Texts().email!,
                  icon: const Icon(Icons.email),
                  text: Texts().email!,
                ),
                SizedBox(height: SizeConfig.defultSize! * 5),
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
                      obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscurePassword: obscurePassword,
                ),
                SizedBox(height: SizeConfig.defultSize! * 5),
                CustomTextField(
                  controller: nameController,
                  type: TextInputType.name,
                  label: Texts().name!,
                  icon: const Icon(Icons.person),
                  text: Texts().name!,
                ),
                SizedBox(height: SizeConfig.defultSize! * 5),
                CustomGeneralButton(onPressed:(){_showSubscriptionDialog(context);} , text: selectedPlan== '' ? "select your plan": selectedPlan,
                  color: Colors.grey,),
                SizedBox(height: SizeConfig.defultSize! * 5),
                Text('Gender: ',style: TextStyle(fontSize: 20),),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text('male',style: TextStyle(fontSize: 18)),
                        value: male,
                        onChanged: (bool? value) {
                          setState(() {
                            male = value!;
                            female = !value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        splashRadius: 5,
                        title: Text('female',style: TextStyle(fontSize: 18)),
                        value: female,
                        onChanged: (bool? value) {
                          setState(() {
                            female = value!;
                            male = !value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.defultSize! * 5),
                CustomGeneralButton(
                  text: Texts().signup!,
                  onPressed: () {
                    if(emailController.text!='' && passwordController.text != '' && nameController.text != '') {
                      AuthState.signup(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          male ? 'male' : 'female',
                          context);
                    }else{
                      CherryToast.error(
                          title: Text('fill all the data first',
                              style: TextStyle(color: Colors.black)))
                          .show(context);
                    }
                    },
                ),
                SizedBox(height: SizeConfig.defultSize! * 2),
                TextBetweenLines(
                  text: Settings.isArabic ? "او" : "OR",
                ),
                SizedBox(height: SizeConfig.defultSize! * 1),
                CustomGeneralButton(
                  text: Texts().login!,
                  onPressed: widget.loginOnPressed,
                ),
                PrivcyPolicy()
              ],
            ),
          ),
        ],
      ),
    );
  }
  _showSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Subscription Plan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text('1 month - 100 L.E'),
                value: '1 month - 100 L.E',
                groupValue: selectedPlan,
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value!;
                    Navigator.of(context).pop(selectedPlan);
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('6 months - 500 L.E'),
                value: '6 months - 500 L.E',
                groupValue: selectedPlan,
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value!;
                    Navigator.of(context).pop(selectedPlan);
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('1 year - 1000 L.E'),
                value: '1 year - 1000 L.E',
                groupValue: selectedPlan,
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value!;
                    Navigator.of(context).pop(selectedPlan);
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
