import 'package:app1/provider/theme_provider.dart';
import 'package:app1/routes.dart';
import 'package:app1/screeen/login_screen.dart';
import 'package:app1/screeen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/flags_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
      ChangeNotifierProvider(create: (context) => FlagsProvider()),
    ], child: PMSNApp());
  }
}

class PMSNApp extends StatelessWidget {
  PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: theme.getthemeData(),
      routes: getApplicationRoutes(),
      home: LoginScreen(),
    );
  }
}
