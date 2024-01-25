import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Users {
  Users(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Get the current user's information
  Future<SelfResponse> self() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/users/self');
    final SelfResponseBaseResponse baseResponse = SelfResponseBaseResponse.fromJson(response.data!);

    return baseResponse.data;
  }
}
