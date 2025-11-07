import 'package:event_app/config/theme/theme_manager.dart';
import 'package:event_app/core/routes_manager/app_routes.dart';
import 'package:event_app/core/routes_manager/router.dart';
import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(ChangeNotifierProvider(
      create: (context)=>ConfigProvider(),
      child: Evently()
  )
  );
}

class Evently extends StatelessWidget {


  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,
        initialRoute: AppRoutes.mainLayout,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: configProvider.currentTheme,
        locale: Locale(configProvider.currentLanguage),
        localizationsDelegates:AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale("en"),
          Locale("ar")
        ],
      ),
    );
  }
}
