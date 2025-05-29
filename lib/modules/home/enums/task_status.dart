import 'package:flutter/material.dart';

enum TaskStatus {
  notStarted(name: 'Não iniciado', color: Colors.white),
  pending(name: 'Pendente', color: Colors.amber),
  completed(name: 'Concluído', color: Colors.green);

  const TaskStatus({required this.name, required this.color});

  final String name;
  final Color color;
}
