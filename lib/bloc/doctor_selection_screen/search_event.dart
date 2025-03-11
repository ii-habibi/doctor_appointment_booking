part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class LoadDoctorsEvent extends SearchEvent {
  final String selectedCategory;
  final String? selectedCity;

  LoadDoctorsEvent({required this.selectedCategory, this.selectedCity});
}

class SearchDoctorsByCityEvent extends SearchEvent {
  final String selectedCity;

  SearchDoctorsByCityEvent(this.selectedCity);
}

class SearchDoctorsByNameEvent extends SearchEvent {
  final String query;

  SearchDoctorsByNameEvent(this.query);
}
