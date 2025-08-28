
import 'package:equatable/equatable.dart';
import 'package:myapp/feature/model/modelo';


sealed class TareasTerminadasState extends Equatable {
  const TareasTerminadasState();
  @override
  List <Object?> get props=>[];

}

final class TareasTerminadasInitial extends TareasTerminadasState {
  final List<Tarea> tarea = const [];
  @override
  List<Object?> get props => [tarea];
}

final class TareasTerminadasLoading extends TareasTerminadasState {}

final class TareasTerminadasFailure extends TareasTerminadasState {
}