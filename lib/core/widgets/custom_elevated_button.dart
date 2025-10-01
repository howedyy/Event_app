import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key ,required this.text, required this.onPress});
 final String text;
 final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress, child: Text(text)
    );
  }
}
