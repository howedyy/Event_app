import 'package:event_app/config/theme/theme_manager.dart';
import 'package:event_app/core/routes_manager/app_routes.dart';
import 'package:event_app/core/routes_manager/router.dart';
import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/prfes_manager/prefs_manager.dart';
import 'package:event_app/providers/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefsManager.init();
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
        initialRoute:FirebaseAuth.instance.currentUser == null ? AppRoutes.login : AppRoutes.mainLayout,
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
