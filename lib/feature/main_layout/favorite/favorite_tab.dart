import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/widgets/event_item.dart';
import 'package:event_app/models/category_model.dart';
import 'package:event_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: TextField(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.search, color: ColorsManager.blue,),
                 hintText: appLocalizations.search_for_event,
               hintStyle: GoogleFonts.inter(
                 fontSize: 14.sp,
                 fontWeight: FontWeight.bold,
                 color: ColorsManager.blue,
               ),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(14.r),
                 borderSide: BorderSide(color: ColorsManager.blue, width: 1)
                  ),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(14.r),
                     borderSide: BorderSide(color: ColorsManager.blue, width: 1)
                 ),
      
                ),
            ),
          ),
          Expanded(child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index)=>
              EventItem(
                event: EventModel(
                    title: "Meeting for Updating The Development Method",
                    category: CategoryModel.categories[2],
                    description: "description",
                    dateTime: DateTime.now(),
                    timeOfDay: TimeOfDay.now()
                ),
              )

          )
          )
        ],
      ),
    );
  }
}
