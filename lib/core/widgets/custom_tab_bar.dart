import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/widgets/custom_tab_item.dart';
import 'package:event_app/models/catagory_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key,
    required this.categories,
  required this.selectedBgColor,
  required this.unSelectedBgColor,
  required this.selectedFgColor,
  required this.unSelectedFgColor
  });



  final List<CategoryModel> categories;
  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedFgColor;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: widget.categories.length,
      child: TabBar(

          indicatorColor: Colors.transparent,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          isScrollable: true,
          tabs:widget.categories.map((category)=> CustomTabItem(
            category: category,
            selectedBgColor: widget.selectedBgColor,
            selectedFgColor: widget.selectedFgColor,
            unSelectedBgColor: widget.unSelectedBgColor,
            unSelectedFgColor: widget.unSelectedFgColor,
            isSelected:
            selectedIndex ==
                widget.categories.indexOf(category),
          ),
          )
              .toList()
      ),
    );
  }
}
