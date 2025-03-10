import 'package:doctor_appointments/screens/patient/appointments.dart';
import 'package:doctor_appointments/screens/patient/chats.dart';
import 'package:doctor_appointments/screens/patient/home.dart';
import 'package:doctor_appointments/screens/patient/profiles.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarButton extends StatefulWidget {
  const BottomNavigationBarButton({super.key});

  @override
  State<BottomNavigationBarButton> createState() => _BottomNavigationBarButtonState();
}

class _BottomNavigationBarButtonState extends State<BottomNavigationBarButton> {

  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const AppointmentsScreen(),
    const ChatsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PageStorageKey(selectedIndex),
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavItem(icon: Icons.home_outlined, index: 0),
            buildNavItem(icon: Icons.calendar_month_outlined, index: 1),
            buildNavItem(icon: Icons.chat_outlined, index: 2),
            buildNavItem(icon: Icons.person_outline_sharp, index: 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem({required IconData icon, required int index}) {
    return IconButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      icon: Icon(
        icon,
        size: 30,
        color: selectedIndex == index ? Colors.blue : Colors.black38,
      ),
    );
  }
}
