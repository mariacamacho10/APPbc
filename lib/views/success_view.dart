import 'package:flutter/material.dart';

class TareasTerminadasSuccessView extends StatelessWidget {
  final int cantidadTerminadas;

  const TareasTerminadasSuccessView({
    super.key, required this.cantidadTerminadas});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Has terminado $cantidadTerminadas tareas",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}