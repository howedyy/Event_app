import 'package:event_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
   this.labelText,
    this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.isSecure = false,
    this.validator,
    this.controller,
    this.maxLines = 1,
  });
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool isSecure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(


      maxLines: maxLines,
      controller: controller,
      validator: validator,
      obscureText: isSecure,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,



        suffixIcon: suffixIcon ,
      ),
    );
  }
}
