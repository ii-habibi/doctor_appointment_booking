part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class DoctorsLoadedState extends SearchState {
  final List<Map<String, dynamic>> filteredDoctors;
  final List<String> cities;
  final String selectedCity;

  DoctorsLoadedState({
    required this.filteredDoctors,
    required this.cities,
    required this.selectedCity,
  });
}
