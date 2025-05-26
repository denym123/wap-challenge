import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'login.dart';

 class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageLifeCycleState<LoginController, LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
