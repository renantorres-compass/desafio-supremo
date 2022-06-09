import 'package:desafio_supremo/app/core/ui/app_theme.dart';
import 'package:desafio_supremo/app/features/presenter/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData(),
      home: const HomePage(),
    );
  }
}
