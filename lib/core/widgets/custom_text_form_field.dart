import 'package:event_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
  required this.labelText,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.isSecure = false,
    this.validator,
    this.controller,
  });
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool isSecure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isSecure,
      style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w300, color: ColorsManager.black1C),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelText,

          prefixIcon: prefixIcon,



        suffixIcon: suffixIcon ,
      ),
    );
  }
}
