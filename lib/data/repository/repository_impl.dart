import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newtr_application/data/data_source/remote_data_source.dart';
import 'package:newtr_application/data/mapper/mapper.dart';
import 'package:newtr_application/data/network/failure.dart';
import 'package:newtr_application/data/network/network_info.dart';
import 'package:newtr_application/data/network/requests.dart';
import 'package:newtr_application/domain/model/models.dart';
import 'package:newtr_application/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if (await _networkInfo.isConnected){
            // its connected to internet, its safe to call API
      final Response = await _remoteDataSource.login(loginRequest);
      if (Response.status==0) {
        // success
        // return either right
        // return data
        return right(Response.toDomain());
      }else{
        // failure --return business error
        // return either left
        return left(Failure(409, Response.message ?? "business error message"));
      }
    }else {
      // return internet connection error
      // return either left
      return left(Failure(501, "please check your internet connection"));
    } } }