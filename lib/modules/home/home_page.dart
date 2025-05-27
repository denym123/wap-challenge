import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'home.dart';

 class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
