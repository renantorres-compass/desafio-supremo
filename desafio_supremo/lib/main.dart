import 'package:desafio_supremo/app/app_widget.dart';
import 'package:desafio_supremo/app/core/utils/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const AppWidget());
}
