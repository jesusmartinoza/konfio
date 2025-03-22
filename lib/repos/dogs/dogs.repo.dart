import 'package:konfio_challenge/db/db_service.dart';
import 'package:konfio_challenge/models/base_error.dart';
import 'package:konfio_challenge/models/dogs/dog.model.dart';
import 'package:konfio_challenge/repos/base_repo.dart';
import 'package:konfio_challenge/models/base_response.dart';
import 'package:sembast/sembast.dart';

class DogsRepo extends BaseRepo {
  /// Fetches dog objects from API
  Future<BaseResponse<List<DogModel>>> fetchDogs() async {
    try {
      final response = await apiClient.request('api/1151549092634943488');
      List<DogModel> dogs = [];

      for (var r in response) {
        dogs.add(DogModel.fromJson(r));
      }
      return BaseResponse(data: dogs);
    } catch (e) {
      return BaseResponse(error: BaseError(title: e.toString()));
    }
  }

  /// Reads data from local db
  Future<BaseResponse<List<DogModel>>> readDogs() async {
    try {
      final service = DatabaseService.instance;
      final db = await service.database;
      final records = await service.store.find(db);

      List<DogModel> dogs = [];

      for (var r in records) {
        dogs.add(DogModel.fromJson(r.value! as Map<String, dynamic>));
      }
      return BaseResponse(data: dogs);
    } catch (e) {
      return BaseResponse(error: BaseError(title: e.toString()));
    }
  }

  /// Saves list of dogs in local db
  Future<void> saveLocal(List<DogModel> dogs) async {
    final service = DatabaseService.instance;
    final db = await service.database;
    await service.store.delete(db); // Clear existing results
    await service.store.addAll(db, dogs.map((d) => d.toJson()).toList());
  }
}
