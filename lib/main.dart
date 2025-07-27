import 'package:evently_c15/l10n/app_localizations.dart';
import 'package:evently_c15/ui/providers/language_provider.dart';
import 'package:evently_c15/ui/providers/theme_provider.dart';
import 'package:evently_c15/ui/screens/add_event/add_event.dart';
import 'package:evently_c15/ui/screens/home/home.dart';
import 'package:evently_c15/ui/screens/login/login.dart';
import 'package:evently_c15/ui/screens/register/register.dart';
import 'package:evently_c15/ui/screens/splash/splash.dart';
import 'package:evently_c15/ui/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyAehh3GbBXP7tumdBAwWquKZw9m4XVi7eM",
        appId: "1:824582919371:android:a17f1a2af2132be426374e",
        messagingSenderId: "",
        projectId: "evently-c15-offline"),
  );
  runApp( ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (_) => LanguageProvider(),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
   late LanguageProvider languageProvider;
   late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(languageProvider.locale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentMode,
      home: Login(),
    );
  }
}
