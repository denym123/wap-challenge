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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Seja bem vindo \n ao Wap-Challenge',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 74),
                  LoginInputField(
                    label: 'Usuário',
                    controller: controller.userController,
                  ),
                  SizedBox(height: 29),
                  LoginInputField(
                    label: 'Senha',
                    controller: controller.passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                    onPressed: () {
                      controller.login();
                    },
                    label: 'Entrar',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
