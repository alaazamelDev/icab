import 'package:flutter/material.dart';
import 'package:icab/configs/theme_manager.dart';
import 'package:icab/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (context) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier?>(
      builder: (context, theme, _) {
        return MaterialApp(
          title: 'iCab',
          debugShowCheckedModeBanner: false,
          theme: theme?.getTheme(),
          home: const LoginScreen(),
        );
      },
    );
  }
}
