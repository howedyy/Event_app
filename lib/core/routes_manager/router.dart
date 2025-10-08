import 'package:event_app/core/routes_manager/app_routes.dart';
import 'package:event_app/feature/auth/login/login.dart';
import 'package:event_app/feature/auth/register/register.dart';
import 'package:event_app/feature/main_layout/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesManager{
  static Route? router(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.register: {
        return CupertinoPageRoute(builder: (context)=> Register());
      }
      case AppRoutes.login:{
        return CupertinoPageRoute(builder: (context)=>Login());
      }
      case AppRoutes.mainLayout:{
        return CupertinoPageRoute(builder: (context)=>MainLayout());
      }
    }
  }
}