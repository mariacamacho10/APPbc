import 'package:flutter/material.dart';
import 'package:APPBC/widgets/tarea_model.dart';

class TareasSuccessView extends StatelessWidget {
  final List<Tarea> tareas;
  final Function(int) terminada;

  const TareasSuccessView({super.key, required this.tareas, required this.terminada});

  @override
  Widget build(BuildContext context) {
    if (tareas.isEmpty) {
      return const Center(
        child: Text ("No hay tareas pendientes"),
      );
    }

    return List.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        final tarea = [index];
        return ListTile(
          title: Text(
            tarea.titulo,
            style: const TextStyle(color: Colors.white),
              decoration: tarea.terminada
                TextDecoration.lineThrough // tacha la tarea
                TextDecoration.none, // normal
          
          ),
          trailing: IconButton( 
            icon: const Icon(terminada),
            onPressed: () => terminada(index),
        );
      },
    );
  }
}