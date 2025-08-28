import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feature/home/presentation/bloc/bloc/bloc_bloc.dart';
import 'package:myapp/feature/home/presentation/bloc/bloc/bloc_event.dart';
import 'package:myapp/feature/home/presentation/cubit/cubit/cubit_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// bloc maneja la lista de tareas
        BlocProvider(
          create: (context) => TareaBloc()..add(CargarTareas()),
        ),

        /// cubit maneja las tareas terminadas
        BlocProvider(
          create: (context) => TareasTerminadasCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gestor de Tareas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Aquí va tu lista de tareas"),
      ),
    );
  }
}
