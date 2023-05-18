import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/screens/HomePage.dart';
import 'controllers/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff847ccc)),
            appBarTheme: const AppBarTheme(
            ),
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          themeMode: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) =>  ReminderApp(),
          },
        );
      },
    );
  }
}
