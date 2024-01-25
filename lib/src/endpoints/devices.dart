import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Devices {
  Devices(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Get all devices for the current user
  Future<List<DeviceResponse>> all() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/devices');
    final DeviceResponseBaseResponse baseResponse = DeviceResponseBaseResponse.fromJson(response.data!);

    return baseResponse.data ?? List<DeviceResponse>.empty();
  }

  /// Get all shockers for a device
  Future<List<ShockerResponse>> shockers(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/devices/$id/shockers');
    final ShockerResponseBaseResponse baseResponse = ShockerResponseBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse.data ?? List<ShockerResponse>.empty();
  }

  /// Get a device by id
  Future<DeviceResponseWithToken> get(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/devices/$id');
    final DeviceResponseWithTokenBaseResponse baseResponse = DeviceResponseWithTokenBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exist';
    }

    return baseResponse.data!;
  }

  /// Update a device
  Future<ObjectBaseResponse> update(String id, { String? name }) async {
    final Response<OpenShockResponse> response = await _openShock.client.patch<OpenShockResponse>(
      '/1/devices/$id',
      data: <String, dynamic>{
        'name': name,
      },
    );

    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exist';
    }

    return baseResponse;
  }

  /// Regenerate a device token
  Future<ObjectBaseResponse> regenerateToken(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.put<OpenShockResponse>('/1/devices/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exist';

      case 500:
        throw baseResponse.message ?? 'Failed to save regenerated token';
    }

    return baseResponse;
  }

  /// Delete a device
  Future<ObjectBaseResponse> delete(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/devices/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exist';
    }

    return baseResponse;
  }

  /// Create a device
  Future<GuidBaseResponse> create() async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>('/1/devices');
    final GuidBaseResponse baseResponse = GuidBaseResponse.fromJson(response.data!);

    return baseResponse;
  }

  /// Get a pair code for a device
  Future<StringBaseResponse> pair(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/devices/$id/pair');
    final StringBaseResponse baseResponse = StringBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exist or does not belong to you';
    }

    return baseResponse;
  }

  /// Get LCG info for a device
  Future<LcgResponse> info(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/devices/$id/lcg');
    final LcgResponseBaseResponse baseResponse = LcgResponseBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device is not online';

      case 412:
        throw baseResponse.message ?? 'Device is online but not connected to a LCG node, you might need to upgrade your firmware to use this feature';

      case 500:
        throw baseResponse.message ?? 'Internal server error, lcg node could not be found';
    }

    return baseResponse.data!;
  }
}
