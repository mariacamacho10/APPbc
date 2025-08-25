import 'package:flutter_bloc/flutter_bloc.dart';
import 'package: APPBC/widgets/tareas_model.dart';
import 'tareas_event.dart';
import 'tareas_state.dart';
import 'tareas/cubit/tareas_cubit.dart';


class TareasBloc extends Bloc<TareasEvent, TareasState> {
  final TareasCubit tareasCubit; // tiene un cubit que va a usar

  // Empieza el estado inicial
  TareasBloc(this.tareasCubit) : super(TareasInitial()) {
    
    // Carga las tareas al inicio
    on<CargarTareas>((event, emit) async {
      emit(TareasLoading());
      emit(TareasSuccess([])); // Una lista vacía
    });

    // Para agregar una nueva tarea
    on<AgregarTarea>((event, emit) {
      if (state is TareasSuccess) {
      
        final tareas = List<Tareas>.from((state as TareasSuccess).tareas)
          ..add(event.tarea); // Se agrega la tarea

        print('Se agregó la tarea');
        emit(TareasSuccess(tareas)); // Se actualiza el estado con la lista nueva
      }
    });

    // Una tarea como completada
    on<CompletarTarea>((event, emit) {
      if (state is TareasSuccess) {
        final tareas = List<Tareas>.from((state as TareasSuccess));
        final tareaTerminada = tareas[event.index];

        if (tareaTerminada) {
          tareas[event.index] = tareaTerminada.copyWith(true);

          print('Tarea terminada'); // Muestra cuál se terminó
          tareasCubit.incrementar(); //  Aumenta
        }

        emit(TareasSuccess(tareas)); // Actualiza el estado con la lista modificada
      }
    });
  }
}