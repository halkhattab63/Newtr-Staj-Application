import 'package:newtr_application/data/network/app_api.dart';
import 'package:newtr_application/data/network/requests.dart';
import 'package:newtr_application/data/response/responses.dart';
import 'package:newtr_application/domain/model/models.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient); 
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
}