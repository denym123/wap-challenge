import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState
    extends PageLifeCycleState<SplashController, SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Splash')));
  }
}
