import 'package:bloc/bloc.dart';
import 'package:doctor_appointments/dummyData/doctors_list.dart';
import 'package:meta/meta.dart';

part 'doctor_city_filter_event.dart';
part 'doctor_city_filter_state.dart';

class DoctorCityFilterBloc extends Bloc<DoctorCityFilterEvent, DoctorCityFilterState> {
  DoctorCityFilterBloc() : super(DoctorCityFilterInitial()) {
    on<DoctorCityFilterAllCitiesEvent>(allCities);
  }

  Future<void> allCities(DoctorCityFilterAllCitiesEvent event, Emitter<DoctorCityFilterState> emit) async {
    List<String> cities = doctors.map((doc) => doc["city"] as String).toSet().toList();
    cities.sort();
    cities.insert(0, "All Cities");
    emit(DoctorAllCitiesState(cities));
  }
}
