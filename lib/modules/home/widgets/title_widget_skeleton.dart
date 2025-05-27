import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TitleWidgetSkeleton extends StatelessWidget {
  const TitleWidgetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        width: Random().nextInt(100).toDouble() + 150,
      ),
    );
  }
}
