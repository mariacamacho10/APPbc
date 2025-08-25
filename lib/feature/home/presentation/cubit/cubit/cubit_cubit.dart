import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:APPBC/widgets/tareasterminadas_model.dart';
import 'tareasterminadas_state.dart';

class TareasTerminadasCubit extends Cubit<TareasTerminadasState> {
  TareasTerminadasCubit() : super(const TareasTerminadasState());

  void incrementar() => emit(state + 1); 
  void decrementar() => emit(state - 1);
  void resetear() => emit(0); // reinicia el conteo de tareas
}
