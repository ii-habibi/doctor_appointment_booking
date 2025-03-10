part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class DoctorsSelectionScreenFilterEvent extends SearchEvent{
  String selectedCategory;
  String selectedCity;
  List<Map<String, dynamic>> doctors;

  DoctorsSelectionScreenFilterEvent({
  required this.selectedCity,
  required this.selectedCategory,
  required this.doctors
  });
}

 final class DoctorSearchEvent extends SearchEvent{
  String query;

  DoctorSearchEvent(this.query);
}
