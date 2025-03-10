import 'package:doctor_appointments/widgets/doctor/doctor_bottom_nav.dart';
import 'package:doctor_appointments/widgets/patient/bottom_Nav.dart';
import 'package:flutter/material.dart';

class DoctorPatientSwitch extends StatefulWidget {
  const DoctorPatientSwitch({super.key});

  @override
  State<DoctorPatientSwitch> createState() => _DoctorPatientSwitchState();
}

class _DoctorPatientSwitchState extends State<DoctorPatientSwitch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: const Text("Patient"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarButton()));
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                child: Text("Doctor"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorBottomNavBar()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
