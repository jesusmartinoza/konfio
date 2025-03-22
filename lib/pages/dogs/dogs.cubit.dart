import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/pages/dogs/dogs.state.dart';
import 'package:konfio_challenge/repos/dogs/dogs.repo.dart';
import 'package:konfio_challenge/utils/extensions.dart';

class DogsCubit extends Cubit<DogsState> {
  final _repo = DogsRepo();
  DogsCubit() : super(DogsState());

  /// Gets Dogs from API
  Future fetchDogs() async {
    var response = await _repo.fetchDogs();

    if (response.error != null) {
      // show error
    } else {
      response.data?.let((dogs) {
        emit(DogsState(dogs: dogs));
        _repo.saveLocal(dogs);
      });
    }
  }

  /// Gets Dogs from local
  Future<void> readDogs() async {
    var response = await _repo.readDogs();

    if (response.error != null) {
      // show error
    } else {
      emit(DogsState(dogs: response.data ?? []));
    }
  }
}
