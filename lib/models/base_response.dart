import 'package:konfio_challenge/models/base_error.dart';

/// It represents mapped data given from data repository.
class BaseResponse<T> {
  /// Optional data. Dynamic
  T? data;

  /// Optional error to show to user.
  BaseError? error;

  BaseResponse({this.data, this.error});
}
