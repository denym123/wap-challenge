import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class SignalFutureBuilder<D> extends StatelessWidget {
  final AsyncState<D> asyncState;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Function(D data) builder;

  const SignalFutureBuilder({
    super.key,
    required this.asyncState,
    required this.builder,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (asyncState.isLoading) {
          return loadingWidget ?? CircularProgressIndicator();
        } else if (asyncState.hasError) {
          return errorWidget ?? Text("Erro: ${asyncState.error}");
        } else if (asyncState.hasValue &&
            asyncState.value is D &&
            asyncState.value != null) {
          if (asyncState.value is List && (asyncState.value as List).isEmpty) {
            return emptyWidget ?? Text("Nenhum dado encontrado");
          }
          return builder(asyncState.value as D);
        } else {
          return Text("Erro: Erro desconhecido");
        }
      },
    );
  }
}
