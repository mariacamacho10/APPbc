import 'package:equatable/equatable.dart';
import 'package:myapp/feature/model/modelo';


abstract class TareaState extends Equatable {
  const TareaState();

  @override
  List<Object?> get props => [];
}

class TareaInicial extends TareaState {}

class TareaCargando extends TareaState {}

class TareaSuccess extends TareaState {
  final List<Tarea> tareas;

  const TareaSuccess(this.tareas);

  @override
  List<Object?> get props => [tareas];
}

class TareaError extends TareaState {
  final String mensaje;

  const TareaError(this.mensaje);

  @override
  List<Object?> get props => [mensaje];
}
