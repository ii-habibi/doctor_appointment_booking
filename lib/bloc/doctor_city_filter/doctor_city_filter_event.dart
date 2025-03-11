part of 'doctor_city_filter_bloc.dart';

@immutable
sealed class DoctorCityFilterEvent {}

final class DoctorCityFilterAllCitiesEvent extends DoctorCityFilterEvent {}

final class SearchQueryEvent extends DoctorCityFilterEvent {
  final String searchQuery;
  final String selectedCity;

  SearchQueryEvent(this.searchQuery, this.selectedCity);
}
