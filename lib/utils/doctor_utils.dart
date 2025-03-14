
import 'package:doctor_appointments/dummyData/doctors_list.dart';

int getDoctorCount(String categoryLabel, String? city) {
  return doctors.where((doctor) {
    final bool matchesCategory = categoryLabel == "Cardiology"
        ? doctor["speciality"] == "Cardiologist"
        : doctor["speciality"] == categoryLabel;
    final bool matchesCity = (city == null || city == "All Cities") || doctor["city"] == city;
    return matchesCategory && matchesCity;
  }).length;
}

List<Map<String, dynamic>> getFilteredDoctors(
    List<Map<String, dynamic>> doctors,
    String selectedCategory,
    String? selectedCity,
    ) {
  return doctors.where((doctor) {
    final bool matchesCategory = selectedCategory == "Cardiology" ? doctor["speciality"] == "Cardiologist" : doctor["speciality"] == selectedCategory;
    final bool matchesCity = selectedCity == "All Cities" ? true : doctor["city"] == selectedCity;
    return matchesCategory && matchesCity;
  }).toList();
}
