import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/core.dart';
import 'login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageLifeCycleState<LoginController, LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                key: _formKey,
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
                    Watch((context) {
                      return LoginInputField(
                        label: 'Usuário',
                        enabled: !controller.loginAS.isLoading,
                        controller: controller.userController,
                        validator:
                            (p0) => p0!.isEmpty ? 'Preencha o campo' : null,
                      );
                    }),
                    SizedBox(height: 29),
                    Watch((context) {
                      return LoginInputField(
                        label: 'Senha',
                        enabled: !controller.loginAS.isLoading,
                        controller: controller.passwordController,
                        obscureText: true,
                        validator:
                            (p0) => p0!.isEmpty ? 'Preencha o campo' : null,
                      );
                    }),
                    SizedBox(height: 30),
                    Watch((context) {
                      return PrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                        label: 'Entrar',
                        isLoading: controller.loginAS.isLoading,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
