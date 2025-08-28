import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feature/home/presentation/bloc/bloc/bloc_event.dart';
import 'package:myapp/feature/home/presentation/bloc/bloc/bloc_state.dart';
import 'package:myapp/feature/model/modelo';
import 'dart:convert';
import 'package:http/http.dart' as http;



class TareaBloc extends Bloc<TareaEvent, TareaState> {
  TareaBloc() : super(TareaInicial()) {
    on<CargarTareas>(_onCargarTareas);
  }

  Future<void> _onCargarTareas(
    CargarTareas event,
    Emitter<TareaState> emit,
  ) async {
    emit(TareaCargando());
    try {
      final tareas = await fetchTarea();
      emit(TareaSuccess(tareas));
    } catch (e) {
      emit(TareaError(e.toString()));
    }
  }

  Future<List<Tarea>> fetchTarea() async {
    final url = Uri.parse(
      "http://jsonblob.com/1409987893673517056",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List lista = data["tarea"];
      return lista.map((t) => Tarea.fromJson(t)).toList();
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }
}
