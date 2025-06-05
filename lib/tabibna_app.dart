import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabibna/core/utils/constans.dart';
import 'package:tabibna/routing/app_router.dart';
import 'package:tabibna/routing/routes.dart';

import 'core/utils/color_manger.dart';

class TabibnaApp extends StatelessWidget {
  final AppRouter appRouter;
  const TabibnaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: ColorManager.water,
          scaffoldBackgroundColor: ColorManager.white,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
