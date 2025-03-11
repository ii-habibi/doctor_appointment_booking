import 'package:bloc/bloc.dart';
import 'package:doctor_appointments/dummyData/doctors_list.dart';
import 'package:doctor_appointments/utils/doctor_utils.dart';
import 'package:meta/meta.dart';

part 'doctor_city_filter_event.dart';
part 'doctor_city_filter_state.dart';

class DoctorCityFilterBloc extends Bloc<DoctorCityFilterEvent, DoctorCityFilterState> {
  DoctorCityFilterBloc() : super(DoctorCityFilterInitial()) {
    on<DoctorCityFilterAllCitiesEvent>(allCities);
    on<SearchQueryEvent>(searchQuery);
  }

  Future<void> allCities(DoctorCityFilterAllCitiesEvent event, Emitter<DoctorCityFilterState> emit) async {
    List<String> cities = doctors.map((doc) => doc["city"] as String).toSet().toList();
    cities.sort();
    cities.insert(0, "All Cities");;

    emit(DoctorAllCitiesState(cities));
  }

  Future<void> searchQuery(SearchQueryEvent event, Emitter<DoctorCityFilterState> emit) async {
    final searchQuery = event.searchQuery;
    final selectedCity = event.selectedCity;

    List<Map<String, dynamic>> filteredCategories = categories.where((category) {
      final label = (category["label"] as String).toLowerCase();
      final matchesQuery = searchQuery.isEmpty || label.contains(searchQuery.toLowerCase());
      final doctorCount = getDoctorCount(category["label"], selectedCity);

      return matchesQuery && doctorCount > 0;
    }).toList();

    emit(AllDocCategorySearchState(filteredCategories));
  }

}
