import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Account {
  Account(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Log into your account
  Future<ObjectBaseResponse> login({ required String email, required String password }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/account/login',
      data: <dynamic, String> {
        'email': email,
        'password': password,
      },
    );

    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 401:
        throw baseResponse.message ?? 'Invalid username or password';

      case 403:
        throw baseResponse.message ?? 'Account not activated';
    }

    return baseResponse;
  }

  /// Create a new account
  Future<ObjectBaseResponse> signup({ required String username, required String email, required String password }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/account/signup',
      data: <dynamic, String> {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 400:
        throw baseResponse.message ?? 'Username or email already exists';
    }

    return baseResponse;
  }
}
