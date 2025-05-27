import 'package:flutter/material.dart';
import '../../../core/core.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int answered;
  final int total;
  final String createdAt;
  const TaskWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.answered,
    required this.total,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  '$answered/$total',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
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
                createdAt.formatDate(toPattern: 'HH:mm - dd/MM/yyyy'),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    semanticsLabel: "teste",
                    semanticsValue: "teste",
                    value: _calculatePercentage(answered, total),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.1),
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.5),
                  ),
                  Text(
                    '40%',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _calculatePercentage(int value, int total) {
    if (total == 0) return 0.0;
    return value / total;
  }
}
