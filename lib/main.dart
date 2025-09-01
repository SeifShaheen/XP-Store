import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:xp_store/screens/welcome_screen.dart';
import 'package:xp_store/l10n/app_localizations.dart';
import 'package:xp_store/providers/language_provider.dart';

void main() {
  runApp(const XPStoreApp());
}

class XPStoreApp extends StatelessWidget {
  const XPStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            title: 'XP Gaming Store',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              fontFamily: 'Suwannaphum',
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF00FF88),
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            // Localization configuration
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: languageProvider.currentLocale,
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
