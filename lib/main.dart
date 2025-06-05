import 'package:flutter/material.dart';
import 'package:tabibna/routing/app_router.dart';
import 'package:tabibna/tabibna_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TabibnaApp(appRouter: AppRouter()));
}
