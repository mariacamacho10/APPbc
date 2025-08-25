import 'package:equatable/equatable.dart';
import 'package/APPBC/widgets/tareas_model.dart';

abstract class TareasState extends Equatable {
  const TareasState();

  @override
  List<Object> get props => [];
}

class TareasInitial extends TareasState {}

class TareasLoading extends TareasState {}

class TareasSuccess extends TareasState {
  final List<Tarea> tareas;

  const TareasSuccess(this.tareas);

  @override
  List<Object> get props => [tareas];
}

class TareasFailure extends TareasState {
  final error;

  const TareasFailure(this.error);

  @override
  List<Object> get props => [error];
}