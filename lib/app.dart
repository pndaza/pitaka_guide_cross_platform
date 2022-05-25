import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/theme_controller.dart';
import 'pages/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ThemeController>(
        create: (_) => ThemeController(),
        builder: (context, __) {
          return ValueListenableBuilder<ThemeMode>(
              valueListenable: context.read<ThemeController>().themeMode,
              builder: (_, themeMode, __) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  // theme: FlexColorScheme.light(scheme: FlexScheme.espresso).toTheme,
                  // darkTheme: FlexColorScheme.dark(scheme: FlexScheme.indigo, appBarElevation: 2).toTheme,
                  themeMode: themeMode,
                  theme: ThemeData.from(
                      colorScheme: const ColorScheme.light().copyWith(
                          primary: const Color.fromARGB(255, 81, 35, 35),
                          secondary: const Color.fromARGB(255, 0, 188, 169))),
                  darkTheme: ThemeData.from(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Colors.amberAccent,
                          // primary: const Color.fromARGB(255, 81, 35, 35),
                          secondary: const Color.fromARGB(255, 0, 188, 169),
                          brightness: Brightness.dark)),
                  home: const HomePage(),
                );
              });
        });
  }
}
