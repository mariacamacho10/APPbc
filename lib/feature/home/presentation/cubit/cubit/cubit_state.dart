import 'package:APPBC/widgets/tareasterminadas_model.dart';


abstract class TareasTerminadasState {}

class TareasTerminadasInitial extends TareasTerminadasState {}

class TareasTerminadasLoading extends TareasTerminadasState {}

class TareasTerminadasSuccess extends TareasTerminadasState {
  final Tarea tarea;
  TareasTerminadasSuccess(this.tarea);
}

class TareasTerminadasFailure extends TareasTerminadasState {
  final String error;
  TareasTerminadasFailure(this.error);
}