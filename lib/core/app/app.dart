
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_config.dart';

/// Lens pages uygulamamız
@immutable
final class App extends StatelessWidget {
// ignore: public_member_api_docs
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders().items,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: AppTheme.appLightTheme,
        darkTheme: AppTheme.appDarkTheme,
        themeMode: ThemeMode.light,//themeProvider.themeMode,
        title: 'Online Bilet',
      ),
    );
  }
}
