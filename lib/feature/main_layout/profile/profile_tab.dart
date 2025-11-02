import 'package:event_app/core/resources/assets_manager.dart';
import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/feature/main_layout/profile/custom_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../l10n/app_localizations.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 16,horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.r)
            )
          ),
          child: SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Row(
              children: [
                Image.asset(ImageAssets.routeBg),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Mohamed Howedy", style:
                      GoogleFonts.inter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      )
                      ),
                      Text("m.howedy151@icloud.com", style:
                      GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white,
                      )
                      )
                  
                    ],
                  ),
                  
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h,),
        CustomDropdownItem(label: appLocalizations.theme, selectedLabel: appLocalizations.light,menuItems: [appLocalizations.light, appLocalizations.dark],),
        SizedBox(height: 16.h,),
        CustomDropdownItem(label: appLocalizations.language, selectedLabel: "En", menuItems: ["English", "عربي"],),

        Spacer(
          flex: 7,
        ),
        Container(
          margin: REdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: REdgeInsets.symmetric(horizontal: 16,vertical: 16),
                backgroundColor: ColorsManager.red,
                foregroundColor: ColorsManager.white,
                textStyle: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.white
                ),
              ),
              onPressed: (){}, child: Row(
            children: [
              Icon(Icons.logout),
              SizedBox(width: 8.w,),
              Text(appLocalizations.logout)
            ],
          )
          ),
        ),
        Spacer(
          flex: 3,
        )
      ],
    );
  }
}
