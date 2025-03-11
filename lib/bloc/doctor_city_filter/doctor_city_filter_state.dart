part of 'doctor_city_filter_bloc.dart';

@immutable
sealed class DoctorCityFilterState {}

final class DoctorCityFilterInitial extends DoctorCityFilterState {}

final class DoctorAllCitiesState extends DoctorCityFilterState {
  final List<String> cities;
  DoctorAllCitiesState(this.cities);
}

final class AllDocCategorySearchState extends DoctorCityFilterState {
  final List<Map<String, dynamic>> filteredCategories;

  AllDocCategorySearchState(this.filteredCategories);
}
