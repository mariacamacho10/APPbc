import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class TareaEvent extends Equatable {
  const TareaEvent();

  @override
  List<Object?> get props => [];
}

// event para cargar las tareas desde el JSON
class CargarTareas extends TareaEvent {}
