import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextBetweenLines extends StatelessWidget {
  final String text;

  const TextBetweenLines({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PrivcyPolicy extends StatefulWidget {
  const PrivcyPolicy({super.key});

  @override
  State<PrivcyPolicy> createState() => _PrivcyPolicyState();
}

class _PrivcyPolicyState extends State<PrivcyPolicy> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          text: 'By registering with us, you agree to our ',
          style: TextStyle(color: Colors.black, fontSize: 16.0),
          children: <TextSpan>[
            TextSpan(
              text: 'privacy policy',
              style: TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AuthState.launchURL('https://mimo902.github.io/privacy/');
                },
            ),
          ],
        ))
    ;
  }
}
