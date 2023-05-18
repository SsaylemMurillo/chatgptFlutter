import 'package:chat_gpt_mobile/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import 'ui/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.dark,
      title: 'ChatGPT',
      home: const MainPage(),
    );
  }
}
