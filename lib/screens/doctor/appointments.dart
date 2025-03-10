import 'package:flutter/material.dart';

class DoctorAppointments extends StatefulWidget {
  const DoctorAppointments({super.key});

  @override
  State<DoctorAppointments> createState() => _DoctorAppointmentsState();
}

class _DoctorAppointmentsState extends State<DoctorAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Appointments")),
      body: const Center(child: Text("Appointments")),
    );
  }
}
