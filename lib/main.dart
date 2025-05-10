import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/core/helper/custom_bloc_observer.dart';
import 'package:pharmacy_app/core/helper/get_it_service.dart';
import 'package:pharmacy_app/core/helper/on_generate.dart';
import 'package:pharmacy_app/feature/splash/presentation/view/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // initialize supabase
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: kSupbaseUrl,
    anonKey: kSupbaseAnonKey,
  );
  // initialize bloc observer
  Bloc.observer = CustomBlocObserver();
  // initialize getIt
  setupGetIt();
  // run app
  runApp(
    // DevicePreview to see app in different devices
    DevicePreview(
      enabled: false,
      builder: (context) => PharmacyApp(),
    ),
  );
}

// main app
class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    // material app with localization arabic
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'EG'),
      ],
      // theme app with white background and cairo font
      theme: ThemeData(
        fontFamily: 'cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      // debug show checked mode banner
      debugShowCheckedModeBanner: false,
      // routes
      onGenerateRoute: onGenerateRoute,
      // initial route
      initialRoute: SplashView.routeName,
    );
  }
}
