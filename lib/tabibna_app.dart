import 'package:flutter/material.dart';
import 'package:tabibna/routing/app_router.dart';
import 'package:tabibna/routing/routes.dart';

class TabibnaApp extends StatelessWidget {
  const TabibnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pretium Finanace',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
