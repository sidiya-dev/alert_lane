import 'package:alert_lane/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
