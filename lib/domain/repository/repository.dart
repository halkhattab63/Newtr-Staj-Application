import 'package:dartz/dartz.dart';
import 'package:newtr_application/data/network/failure.dart';
import 'package:newtr_application/data/network/requests.dart';
import 'package:newtr_application/domain/model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest );
}