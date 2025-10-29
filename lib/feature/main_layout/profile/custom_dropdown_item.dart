import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/colors_manager.dart';

class CustomDropdownItem extends StatelessWidget {
  const CustomDropdownItem({super.key, required this.label, required this.selectedLabel, required this.menuItems});
final String label;
final String selectedLabel;
final List<String> menuItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium
          ),
          SizedBox(height: 16.h,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: ColorsManager.blue, width: 1.w)
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Text(selectedLabel,
                    style: Theme.of(context).textTheme.labelLarge
                  ),
                  Spacer(),
                  DropdownButton(
                    underline: Container(),
                    items: menuItems.map((item)=> DropdownMenuItem(
                        value: item,
                        child: Text(item))).toList(),
                    onChanged: (selectedItem) {

                    },
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
