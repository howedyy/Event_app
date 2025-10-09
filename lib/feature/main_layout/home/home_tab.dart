import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/widgets/custom_tab_bar.dart';
import 'package:event_app/core/widgets/custom_tab_item.dart';
import 'package:event_app/models/catagory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
        width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r))
          ),
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back ✨",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text("Mohamed Howedy",
                          style:Theme.of(context).textTheme.headlineLarge,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: ColorsManager.white,),
                            Text("Cairo, Egypt",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        )
            
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.light_mode, color: ColorsManager.white,),
                    SizedBox(width: 10.w,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("En",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
            
                  ],
                ),
                SizedBox(height: 12.h,),
               CustomTabBar(categories: CategoryModel.categoriesWithAll,
                   selectedBgColor: Theme.of(context).colorScheme.primary,
                   unSelectedBgColor: Theme.of(context).colorScheme.secondary,
                   selectedFgColor: Theme.of(context).colorScheme.onPrimary,
                   unSelectedFgColor: Theme.of(context).colorScheme.onSecondary
               ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
