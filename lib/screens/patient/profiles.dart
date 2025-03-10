import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/doctor.png"),
                      radius: 50,
                      backgroundColor: Colors.brown,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Habib Ullah",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Email:"),
                    SizedBox(height: 5),
                    Text("Phone"),
                    SizedBox(height: 5),
                    Text("DOB:"),
                    SizedBox(height: 5),
                    Text("Age:"),
                    SizedBox(height: 5),
                    Text("Marital Status"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
