import 'package:event_app/core/routes_manager/app_routes.dart';
import 'package:event_app/feature/auth/login/login.dart';
import 'package:event_app/feature/auth/register/register.dart';
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
    }
  }
}