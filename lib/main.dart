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
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: kSupbaseUrl,
    anonKey: kSupbaseAnonKey,
  );
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => PharmacyApp(),
    ),
  );
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'EG'),
      ],
      theme: ThemeData(
        fontFamily: 'cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
