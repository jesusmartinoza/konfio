import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/pages/dogs/dogs.state.dart';
import 'package:konfio_challenge/repos/dogs/dogs.repo.dart';

class DogsCubit extends Cubit<DogsState> {
  final _repo = DogsRepo();
  DogsCubit() : super(DogsState());

  fetchDogs() async {
    var response = await _repo.fetchDogs();

    if (response.error != null) {
      // show error
    } else {
      emit(DogsState(dogs: response.data ?? []));
    }
  }
}
