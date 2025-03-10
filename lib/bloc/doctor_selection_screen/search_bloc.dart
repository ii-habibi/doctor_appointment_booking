import 'package:bloc/bloc.dart';
import 'package:doctor_appointments/utils/doctor_utils.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {


  SearchBloc() : super(SearchInitial()) {
    on<DoctorsSelectionScreenFilterEvent>(filteredDoctors);
    on<DoctorSearchEvent>(filterDoctorsByQuery);
  }

  List<Map<String, dynamic>> originalDoctors = [];

  Future<void> filteredDoctors(DoctorsSelectionScreenFilterEvent event, Emitter<SearchState> emit) async {
    final baseFilteredDoctors = getFilteredDoctors(
      event.doctors,
      event.selectedCategory,
      event.selectedCity,
    );

    originalDoctors = baseFilteredDoctors;
    emit(DoctorFilteredState(baseFilteredDoctors));
  }

  Future<void> filterDoctorsByQuery(
      DoctorSearchEvent event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) {
      emit(DoctorFilteredState(originalDoctors));
      return;
    }

    final filtered = originalDoctors.where((doctor) {
      return doctor["name"].toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(DoctorFilteredState(filtered));
  }
}
