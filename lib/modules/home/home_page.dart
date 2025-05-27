import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Watch((context) {
                return SignalFutureBuilder(
                  loadingWidget: const TitleWidgetSkeleton(),
                  asyncState: controller.userAS.value,
                  builder: (data) {
                    return TitleWidget(title: data.name);
                  },
                );
              }),
              const SizedBox(height: 32),
              Text(
                "Todas as Tasks",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Watch((context) {
                return SignalFutureBuilder(
                  loadingWidget: CircularProgressIndicator(),
                  asyncState: controller.tasksAS.value,
                  builder: (data) {
                    return TaskList(tasks: data);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
