import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feature/home/presentation/cubit/cubit/cubit_state.dart';
import 'package:myapp/feature/model/modelo';

class TareasTerminadasCubit extends Cubit<TareasTerminadasState> {
  TareasTerminadasCubit() : super(TareasTerminadasInitial());

  /// Agrega tarea a la lista de terminadas
  void marcarComoTerminada(Tarea tarea) {
    if (state is TareasTerminadasInitial) {
      final actual = List<Tarea>.from((state as TareasTerminadasInitial).tarea ?? []);
      actual.add(tarea);
      emit(TareasTerminadasInitial()..tarea?.addAll(actual));
    }
  }

  /// Quita tarea de la lista de terminadas
  void desmarcarTarea(Tarea tarea) {
    if (state is TareasTerminadasInitial) {
      final actual = List<Tarea>.from((state as TareasTerminadasInitial).tarea ?? []);
      actual.remove(tarea);
      emit(TareasTerminadasInitial()..tarea?.addAll(actual));
    }
  }

  /// Carga tareas terminadas
  void cargarTareasTerminadas(List<Tarea> tareas) {
    emit(TareasTerminadasLoading());
    try {
      emit(TareasTerminadasInitial()..tarea?.addAll(tareas));
    } catch (e) {
      emit(TareasTerminadasFailure());
    }
  }
}


