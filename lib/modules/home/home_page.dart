import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import '../modules.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sair"),
                onTap: () {
                  Modular.to.navigate(Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Watch((context) {
                return SignalFutureBuilder(
                  errorWidget: TitleWidget(title: "Não encontrado"),
                  loadingWidget: const TitleWidgetSkeleton(),
                  asyncState: controller.userAS.value,
                  builder: (data) {
                    return TitleWidget(title: "Olá, ${data.name}");
                  },
                );
              }),
              const SizedBox(height: 32),
              Text(
                "Todas as Tasks",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                onPressed: () {
                  controller.clearTaskInstances();
                },
                icon: const Icon(Icons.clear),
              ),
              const SizedBox(height: 16),
              Watch((context) {
                return SignalFutureBuilder(
                  loadingWidget: CircularProgressIndicator(),
                  asyncState: controller.tasksAS.value,
                  builder: (data) {
                    return TaskList(tasks: data, controller: controller);
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
