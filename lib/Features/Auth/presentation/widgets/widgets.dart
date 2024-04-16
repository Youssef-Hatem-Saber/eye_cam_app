import 'package:flutter/material.dart';

class WidgetsC{
  Widget getStyledTextField(
      {required TextEditingController? controller,
        required String label,
        bool obscure = false,
        required Icon icon,
        bool isError = false,
        Widget? suffixIcon,
        required var type,
        bool readOnly = false,
        var TextDirection}) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
      keyboardType: type,
      textDirection: TextDirection,
      cursorColor: Colors.blue,
      obscureText: obscure,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.black, fontSize: 15),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: suffixIcon,
          suffixIcon: icon,
          fillColor: Colors.black,
          labelText: label,
     ),
    );
}
  Widget getStyledButton(
      {
      required VoidCallback onPressed,
      required String text,
      }){
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(327, 48),
          backgroundColor: const Color(0xFF54408C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        child: Text(text),
      );
  }
}