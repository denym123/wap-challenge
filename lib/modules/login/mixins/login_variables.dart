import 'package:flutter/material.dart';
import 'package:signals/signals_core.dart';

import '../dtos/login_response_dto.dart';

mixin LoginVariables {
  AsyncSignal<LoginResponseDto?> loginAS = AsyncSignal(AsyncData(null));
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
