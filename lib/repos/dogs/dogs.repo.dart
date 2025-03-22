import 'package:konfio_challenge/models/base_error.dart';
import 'package:konfio_challenge/models/dogs/dog.model.dart';
import 'package:konfio_challenge/repos/base_repo.dart';
import 'package:konfio_challenge/models/base_response.dart';

class DogsRepo extends BaseRepo {
  Future<BaseResponse<List<DogModel>>> fetchDogs() async {
    try {
      final response = await apiClient.request('api/1151549092634943488');
      List<DogModel> dogs = [];

      for (var r in response) {
        dogs.add(DogModel.fromJson(r));
      }
      return BaseResponse(data: dogs);
    } catch (e) {
      print(e);
      return BaseResponse(error: BaseError(title: e.toString()));
    }
  }
}
