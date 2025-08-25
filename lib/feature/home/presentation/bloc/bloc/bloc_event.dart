import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TareasEvent {}

class AgregarTarea extends TareasEvent {
  final Tareas tarea;
  AgregarTarea(this.tarea);
}

class CompletarTarea extends TareasEvent {
  final index;
  CompletarTarea(this.index);
}