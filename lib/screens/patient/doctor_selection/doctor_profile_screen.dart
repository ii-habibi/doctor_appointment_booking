import 'package:flutter/material.dart';
import 'package:doctor_appointments/dummyData/doctors_list.dart';

class DoctorProfileScreen extends StatelessWidget {
  final int doctorId;

  const DoctorProfileScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final doctor = doctors.firstWhere((doc) => doc["id"] == doctorId);

    return Scaffold(
      appBar: AppBar(title: Text(doctor["name"])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/icons/doctor.png",
                  fit: BoxFit.cover,
                  height: 64,
                  width: 64,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              doctor["name"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${doctor["speciality"]} | ${doctor["category"]}",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 8),
                Text(doctor["city"], style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                const SizedBox(width: 8),
                Text("${doctor["rating"]} ★", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.blue),
                const SizedBox(width: 8),
                Text("${doctor["experience"]} Years Experience", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement Booking Logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Booking feature coming soon!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
