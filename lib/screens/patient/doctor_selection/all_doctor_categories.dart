import 'package:doctor_appointments/bloc/doctor_city_filter/doctor_city_filter_bloc.dart';
import 'package:doctor_appointments/screens/patient/doctor_selection/selected_category.dart';
import 'package:doctor_appointments/utils/doctor_utils.dart';
import 'package:doctor_appointments/widgets/patient/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDoctorCategoriesScreen extends StatefulWidget {
  const AllDoctorCategoriesScreen({super.key});

  @override
  State<AllDoctorCategoriesScreen> createState() =>
      _AllDoctorCategoriesScreenState();
}

class _AllDoctorCategoriesScreenState extends State<AllDoctorCategoriesScreen> {
  String selectedCity = "All Cities";

  @override
  void initState() {
    super.initState();

   BlocProvider.of<DoctorCityFilterBloc>(context).add(DoctorCityFilterAllCitiesEvent());
    Future.delayed(Duration.zero, ()
    {
      BlocProvider.of<DoctorCityFilterBloc>(context).add(SearchQueryEvent("", selectedCity));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctors Categories")),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSearchBar(
              onSearch: (value) {
               BlocProvider.of<DoctorCityFilterBloc>(context).add(SearchQueryEvent(value, selectedCity));
              },
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  "All Categories",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
                BlocBuilder<DoctorCityFilterBloc, DoctorCityFilterState>(
                  buildWhen: (previous, current) => current is DoctorAllCitiesState,
                  builder: (context, state) {
                    if (state is DoctorAllCitiesState) {
                      return DropdownButton<String>(
                        value: selectedCity,
                        items: state.cities.map((city) {
                          return DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCity = value;
                            });
                            BlocProvider.of<DoctorCityFilterBloc>(context).add(SearchQueryEvent("", selectedCity));
                          }
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),

              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: BlocBuilder<DoctorCityFilterBloc, DoctorCityFilterState>(
                builder: (context, state) {
                  if (state is AllDocCategorySearchState) {
                    if (state.filteredCategories.isEmpty) {
                      return const Center(child: Text("No categories available."));
                    }
                    return ListView.builder(
                      itemCount: state.filteredCategories.length,
                      itemBuilder: (context, index) {
                        final item = state.filteredCategories[index];
                        int count = getDoctorCount(item["label"], selectedCity);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Hero(
                                tag: item["label"],
                                child: Image.asset(
                                  item["icon"],
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              title: Text(
                                item["label"],
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "($count) Available",
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation, secondaryAnimation) =>
                                        DoctorSelectionScreen(
                                          selectedCategory: item["label"],
                                          selectedCity: selectedCity,
                                        ),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
