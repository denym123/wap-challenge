import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core.dart';

class Messages {
  static void error(String message, {Duration? duration}) {
    final context = Modular.routerDelegate.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        duration: duration ?? const Duration(seconds: 5),
        backgroundColor: AppColors.i.errorColor,
        margin: EdgeInsets.only(left: 10, right: 10),
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: const TextStyle(fontSize: 14)),
      ),
    );
  }

  static void success(String message, {Duration? duration}) {
    final context = Modular.routerDelegate.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        duration: duration ?? const Duration(milliseconds: 1000),
        backgroundColor: Colors.green,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  static void info(String message, {Duration? duration}) {
    final context = Modular.routerDelegate.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        duration: duration ?? const Duration(milliseconds: 1000),
        backgroundColor: Colors.blue,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
