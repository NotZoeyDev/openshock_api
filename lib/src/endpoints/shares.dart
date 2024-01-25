import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Shares {
  Shares(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Delete a share code
  Future<ObjectBaseResponse> delete(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/shares/code/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Shocker does not exist';
    }

    return baseResponse;
  }

  /// Link a share code to your account
  Future<ObjectBaseResponse> link(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>('/1/shares/code/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 400:
        throw baseResponse.message ?? 'You cannot link your own shocker code / You already have this shocker linked to your account';

      case 404:
        throw baseResponse.message ?? 'Share code not found or does not belong to you';

      case 500:
        throw baseResponse.message ?? 'Error while linking share code to your account';
    }

    return baseResponse;
  }

}
