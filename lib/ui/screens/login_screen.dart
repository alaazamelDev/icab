import 'package:flutter/material.dart';
import 'package:icab/configs/theme_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I Cab'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeNotifier>().switchThemeMode();
          },
          child: const Text("Change Theme"),
        ),
      ),
    );
  }
}
