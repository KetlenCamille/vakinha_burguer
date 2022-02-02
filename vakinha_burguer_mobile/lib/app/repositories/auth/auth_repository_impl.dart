import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/exception/user_notfound_exception.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/models/user_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post(
        '/auth/register', {'name': name, 'email': email, 'password': password});

    if (result.hasError) {
      var message = 'Error registering user';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message: message);
    }
    return UserModel.fromJson('source');
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient
        .post('/auth/', {'email': email, 'password': password});
    if (result.hasError) {
      if (result.statusCode == 403) {
        log('User or password invalid',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }

      log('Error authenticating user (${result.statusCode})',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message: 'Error authenticating user');
    }
    return UserModel.fromMap(result.body);
  }
}
