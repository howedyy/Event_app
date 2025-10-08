import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/feature/main_layout/favorite/favorite_tab.dart';
import 'package:event_app/feature/main_layout/home/home_tab.dart';
import 'package:event_app/feature/main_layout/map/map_tab.dart';
import 'package:event_app/feature/main_layout/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatefulWidget {
   const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
List<Widget> tabs = [
  HomeTab(),
  MapTab(),
  FavoriteTab(),
  ProfileTab(),
];
int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:_buildFab(),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  FloatingActionButton _buildFab(){
    return  FloatingActionButton(

      onPressed: (){},
      child: Icon(Icons.add),
    );
  }

  BottomAppBar _buildBottomAppBar(){
    return BottomAppBar(

      color: ColorsManager.blue,
      notchMargin: 8,
      child: BottomNavigationBar(

          currentIndex: selectedIndex,
          onTap: _onTap,

          items: [
            BottomNavigationBarItem(icon: Icon(selectedIndex == 0 ? Icons.home: Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(selectedIndex == 1? Icons.location_on: Icons.location_on_outlined), label: "Map"),
            BottomNavigationBarItem(icon: Icon(selectedIndex == 2? Icons.favorite: Icons.favorite_outline), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(selectedIndex == 3? Icons.person: Icons.person_outline), label: "Profile"),
          ]
      ),
    );
  }

  void _onTap(int newIndex){
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
