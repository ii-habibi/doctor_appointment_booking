import 'package:doctor_appointments/dummyData/doctors_list.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Appointments")),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment["doctor_name"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          appointment["patient_name"]!,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/doctor.png"),
                      radius: 24,
                      backgroundColor: Colors.brown[300],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 20),
                    const SizedBox(width: 4),
                    Text(appointment["time"]!),
                    const SizedBox(width: 10),
                    Text("|", style: TextStyle(color: Colors.black54)),
                    const SizedBox(width: 10),
                    Text(appointment["date"]!),
                  ],
                ),
                const SizedBox(height: 8),
                Text(appointment["reason"], style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "• ${appointment["status"]!}",
                    style: TextStyle(color: appointment["status"] == "Pending" ? Colors.yellow.shade800 :
                    appointment["status"] == "Approved" ? Colors.green :
                    appointment["status"] == "Rejected" || appointment["status"] == "Cancelled" ? Colors.red :
                    appointment["status"] == "Completed" ? Colors.blue : Colors.black54),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
