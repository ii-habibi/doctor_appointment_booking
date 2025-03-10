part of 'doctor_city_filter_bloc.dart';

@immutable
sealed class DoctorCityFilterEvent {}

final class DoctorCityFilterAllCitiesEvent extends DoctorCityFilterEvent {}
