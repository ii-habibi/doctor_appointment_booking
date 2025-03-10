part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class DoctorSearchResultState extends SearchState{
  final List<Map<String, dynamic>> filteredDoctors;

  DoctorSearchResultState(this.filteredDoctors);
}

final class DoctorFilteredState extends SearchState{

  final List<Map<String, dynamic>> filteredDoctors;

  DoctorFilteredState(this.filteredDoctors);
}
