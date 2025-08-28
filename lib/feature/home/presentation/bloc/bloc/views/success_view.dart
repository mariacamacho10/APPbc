import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feature/home/presentation/bloc/bloc/bloc_bloc.dart';
import 'package:myapp/feature/home/presentation/bloc/bloc/bloc_state.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LISTA DE PENDIENTES",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TareaBloc, TareaState>(
        builder: (context, state) {
          if (state is TareaSuccess) {
            final tareas = state.tareas; // JSON cargado desde el Bloc

            return ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                final tarea = tareas[index];
                return ListTile(
                  leading: const Icon(Icons.check_box_outline_blank),
                  title: Text(tarea.tarea1 ?? ''),

                );
              },
            );
          }
          return const Center(child: Text("Sin tareas"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // no hace nada
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
