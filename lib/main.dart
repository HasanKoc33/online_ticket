
import 'package:flutter/material.dart';
import 'package:online_ticked/core/app/app.dart';
import 'package:online_ticked/core/app/app_init.dart';

Future<void> main() async {
  await AppInit.initApp();
  runApp(
    const App(),
  );
}
