import 'package:doctor_appointments/bloc/doctor_selection_screen/search_bloc.dart';
import 'package:doctor_appointments/dummyData/doctors_list.dart';
import 'package:doctor_appointments/screens/patient/doctor_selection/doctor_profile_screen.dart';
import 'package:doctor_appointments/widgets/patient/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorSelectionScreen extends StatefulWidget {
  final String? selectedCity;
  final String selectedCategory;

  const DoctorSelectionScreen({
    super.key,
    this.selectedCity,
    required this.selectedCategory,
  });

  @override
  State<DoctorSelectionScreen> createState() => _DoctorSelectionScreenState();
}

class _DoctorSelectionScreenState extends State<DoctorSelectionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(DoctorsSelectionScreenFilterEvent(
        selectedCity: widget.selectedCity ?? "All Cities",
        selectedCategory: widget.selectedCategory,
        doctors: doctors));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose ${widget.selectedCategory}"),
      ),
      body: Column(
        children: [
          HomeSearchBar(
            onSearch: (value) {
              context.read<SearchBloc>().add(DoctorSearchEvent(value));
            },
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is DoctorFilteredState) {
                  if (state.filteredDoctors.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Results Found",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.filteredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = state.filteredDoctors[index];

                      return  GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 300),
                              pageBuilder: (context, animation, secondaryAnimation) => DoctorProfileScreen(doctorId: doctor["id"]),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                          child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      "assets/icons/doctor.png",
                                      fit: BoxFit.cover,
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor["name"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        doctor["category"],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    // Handle booking
                                  },
                                  child: ElevatedButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Booking feature coming soon!")),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                    child:  Row(
                                      children: [
                                        Icon((Icons.call)),
                                        SizedBox(width: 30,),
                                        Text(
                                          "Book Appointment",
                                          style: TextStyle(fontSize: 18, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Experience",
                                          style: TextStyle(fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 4),
                                        Text("${doctor["experience"]} Years"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Rating",
                                          style: TextStyle(fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 4),
                                        Text("${doctor["rating"]} ★"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
