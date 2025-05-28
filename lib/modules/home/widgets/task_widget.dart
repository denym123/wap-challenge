import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../home.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final double percentage;
  final String? createdAt;
  final TaskStatus taskStatus;

  const TaskWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.percentage,
    required this.createdAt,
    required this.taskStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: 130),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (taskStatus != TaskStatus.notStarted) ...{
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      percentage.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                },
                if (taskStatus == TaskStatus.completed) ...{
                  Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                },
              ],
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.schedule,
                  size: 16,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                Text(
                  createdAt?.formatDate(toPattern: 'HH:mm - dd/MM/yyyy') ??
                      'Não iniciado',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                const Spacer(),
                if (taskStatus != TaskStatus.notStarted) ...{
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 4,
                        value: percentage,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.1),
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      Text(
                        percentage.toString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
