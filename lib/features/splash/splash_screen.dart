import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../core/utils/assets_manger.dart';
import '../../core/utils/color_manger.dart';
import '../../core/utils/constans.dart';
import '../../routing/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Artboard? _artboard;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  void _loadRiveFile() async {
    final data = await rootBundle.load(AssetsManager.doctorAnitmation);
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;

    final controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    if (controller != null) {
      artboard.addController(controller);
    }

    setState(() {
      _artboard = artboard;
    });

    Future.delayed(const Duration(milliseconds: Constants.splashDelay), () {
      _navigateToHome();
    });
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to\t" + Constants.appName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorManager.deepBlue, // Muted orange
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Find your doctor and book an appointment',
            style: TextStyle(
              fontSize: 18,
              color: ColorManager.darkGrey, // Muted orange
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: (size.height > size.width) ? size.width * 0.9 : size.height,
            height: (size.height > size.width) ? size.width * 0.9 : size.height,
            child:
                _artboard == null
                    ? const SizedBox()
                    : Rive(artboard: _artboard!, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
