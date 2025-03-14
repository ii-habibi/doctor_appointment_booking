import 'package:bloc/bloc.dart';
import 'package:doctor_appointments/dummyData/doctors_list.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<LoadDoctorsEvent>(onLoadDoctors);
    on<SearchDoctorsByCityEvent>(onSearchByCity);
    on<SearchDoctorsByNameEvent>(onSearchByName);
  }


  List<Map<String, dynamic>> originalDoctors = [];
  List<String> cities = [];
  String selectedCity = "All Cities";
  String selectedCategory = "";


  Future<void> onLoadDoctors(LoadDoctorsEvent event, Emitter<SearchState> emit) async {
    selectedCity = event.selectedCity ?? "All Cities";
    selectedCategory = event.selectedCategory;


    originalDoctors = doctors.where((doctor) {
      return doctor["speciality"] == selectedCategory &&
          (selectedCity == "All Cities" || doctor["city"] == selectedCity);
    }).toList();

    cities = doctors
        .where((doctor) => doctor["speciality"] == selectedCategory)
        .map((doctor) => doctor["city"] as String)
        .toSet()
        .toList();
    cities.sort();
    cities.insert(0, "All Cities");

    emit(DoctorsLoadedState(
      filteredDoctors: originalDoctors,
      cities: cities,
      selectedCity: selectedCity,
    ));
  }

  Future<void> onSearchByCity(SearchDoctorsByCityEvent event, Emitter<SearchState> emit) async {
    selectedCity = event.selectedCity;

    final filteredDoctors = originalDoctors.where((doctor) {
      return selectedCity == "All Cities" || doctor["city"] == selectedCity;
    }).toList();

    emit(DoctorsLoadedState(
      filteredDoctors: filteredDoctors,
      cities: cities,
      selectedCity: selectedCity,
    ));
  }

  Future<void> onSearchByName(SearchDoctorsByNameEvent event, Emitter<SearchState> emit)  async{
    final filteredDoctors = originalDoctors.where((doctor) {
      return doctor["name"].toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(DoctorsLoadedState(
      filteredDoctors: filteredDoctors,
      cities: cities,
      selectedCity: selectedCity,
    ));
  }
}
