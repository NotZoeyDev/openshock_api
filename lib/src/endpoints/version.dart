import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Version {
  Version(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Get the version of the OpenShock backend
  Future<VersionResponse> get() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1');
    final VersionResponseBaseResponse baseResponse = VersionResponseBaseResponse.fromJson(response.data!);

    return baseResponse.data;
  }
}
