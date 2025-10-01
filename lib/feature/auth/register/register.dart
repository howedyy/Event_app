import 'package:event_app/core/resources/assets_manager.dart';
import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/routes_manager/app_routes.dart';
import 'package:event_app/core/widgets/custom_elevated_button.dart';
import 'package:event_app/core/widgets/custom_text_button.dart';
import 'package:event_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     body: Padding(
       padding:  EdgeInsets.only(right: 8, left: 8, bottom: MediaQuery.of(context).viewInsets.top),
       child: SingleChildScrollView(
         child: Column(
           children: [
            Image.asset(ImageAssets.eventlyLogo),
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 SizedBox(height: 24.h,),
                 CustomTextFormField(
                     labelText: "Name",
                     prefixIcon: Icon(Icons.person),
                     keyboardType: TextInputType.name
                 ),
                 SizedBox(height: 16.h,),
                 CustomTextFormField(
                     labelText: "Email",
                     prefixIcon: Icon(Icons.email),
                     keyboardType: TextInputType.emailAddress
                 ),
                 SizedBox(height: 16.h,),
                 CustomTextFormField(
                   isSecure: securePassword,
                   labelText: "Password",
                   prefixIcon: Icon(Icons.lock),
                   keyboardType: TextInputType.visiblePassword,
                   suffixIcon: IconButton(onPressed: _onTogglePasswordIconClicked, icon:Icon(securePassword ? Icons.visibility_off : Icons.visibility)),
                 ),
                 SizedBox(height: 16.h,),
                 CustomTextFormField(
                   isSecure: secureRePassword,
                   labelText: "Re-Password",
                   prefixIcon: Icon(Icons.lock),
                   keyboardType: TextInputType.visiblePassword,
                   suffixIcon: IconButton(onPressed: _onToggleRePasswordIconClicked, icon:Icon(secureRePassword? Icons.visibility_off : Icons.visibility)),
                 ),
                 SizedBox(height: 16.h,),
                 CustomElevatedButton(text: "Create Account", onPress: (){}),
                 SizedBox(height: 16.h,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Already Have Account ? ", style: Theme.of(context).textTheme.bodySmall,),
                     CustomTextButton(text: "Login", onTap: (){})
                   ],
                 )
         
               ],
             )
           ],
         ),
       ),
     ),
    );
  }
  void _onTogglePasswordIconClicked(){
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onToggleRePasswordIconClicked(){
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }
}
