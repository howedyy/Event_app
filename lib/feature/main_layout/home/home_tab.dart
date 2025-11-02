import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/widgets/custom_tab_bar.dart';
import 'package:event_app/core/widgets/event_item.dart';
import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/models/category_model.dart';
import 'package:event_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late AppLocalizations appLocalizations = AppLocalizations.of(context)!;
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
                        Text("${appLocalizations.welcome_back}✨",
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
                    IconButton(onPressed: (){}, icon: Icon(Icons.light_mode, color: ColorsManager.white,)),
                    SizedBox(width: 10.w,),
                    InkWell(
                      onTap: (){},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
            
                  ],
                ),
                SizedBox(height: 12.h,),
               CustomTabBar(categories: CategoryModel.categoriesWithAll,
                   selectedBgColor: ColorsManager.whiteBlue,
                   unSelectedBgColor: Colors.transparent,
                   selectedFgColor: ColorsManager.blue,
                   unSelectedFgColor: ColorsManager.whiteBlue,
               ),

                //Expanded(child: ListView.builder(itemBuilder: (context, index)=> ,itemCount: 20,))
              ],
            ),
          ),
        ),
        Expanded(child: ListView.builder(
          itemBuilder: (context, index)=>EventItem(
          event: EventModel(title: "Meeting for Updating The Development Method", category: CategoryModel.categories[2], description: "description", dateTime: DateTime.now(), timeOfDay: TimeOfDay.now()),
        )
          ,itemCount: 20,)
        )
      ],
    );
  }
}
