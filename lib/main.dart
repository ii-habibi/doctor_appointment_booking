import 'package:doctor_appointments/auth/switch.dart';
import 'package:doctor_appointments/bloc/doctor_city_filter/doctor_city_filter_bloc.dart';
import 'package:doctor_appointments/bloc/doctor_selection_screen/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorCityFilterBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DoctorPatientSwitch(),
      ),
    );
  }
}
