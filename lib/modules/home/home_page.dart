import 'package:flutter/material.dart';
import 'package:signals/signals_core.dart';

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
    return const Scaffold(
      body: Column(
        children: [
          SignalFutureBuilder(
            future: controller.userAS,
            builder: (context, snapshot) {
              return Text(snapshot.data?.name ?? '');
            },
          ),
        ],
      ),
    );
  }
}
