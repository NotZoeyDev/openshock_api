import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Shockers {
  Shockers(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Get all owned shockers
  Future<List<DeviceResponseWithShockers>> all() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/shockers/own');
    final DeviceResponseWithShockersBaseResponse baseResponse = DeviceResponseWithShockersBaseResponse.fromJson(response.data!);

    return baseResponse.data ?? List<DeviceResponseWithShockers>.empty();
  }

  /// Get all shared shockers
  Future<List<OwnerShockerResponse>> shared() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/shockers/shared');
    final OwnerShockerResponseBaseResponse baseResponse = OwnerShockerResponseBaseResponse.fromJson(response.data!);

    return baseResponse.data ?? List<OwnerShockerResponse>.empty();
  }

  /// Create a new shocker
  Future<GuidBaseResponse> create(Shocker shocker) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/shockers',
      data: shocker.toJson(),
    );
    final GuidBaseResponse baseResponse = GuidBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 400:
        throw baseResponse.message ?? 'You can have a maximum of 11 Shockers per Device';

      case 404:
        throw baseResponse.message ?? 'Device does not exist';
    }

    return baseResponse;
  }

  /// Get a shocker info
  Future<ShockerWithDevice> get(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/shockers/$id');
    final ShockerWithDeviceBaseResponse baseResponse = ShockerWithDeviceBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'The shocker does not exist or you do not have access to it';
    }

    return baseResponse.data!;
  }

  /// Update a shocker
  Future<ObjectBaseResponse> update(String id, { required Shocker shocker }) async {
    final Response<OpenShockResponse> response = await _openShock.client.patch<OpenShockResponse>(
      '/1/shockers/$id',
      data: shocker.toJson(),
    );
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Shocker does not exist';
    }

    return baseResponse;
  }

  /// Delete a shocker
  Future<ObjectBaseResponse> delete(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/shockers/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Shocker does not exist';
    }

    return baseResponse;
  }

  /// Pause or unpause a shocker
  Future<BooleanBaseResponse> pause(String id, { bool pause = true }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/shockers/$id/pause',
      data: pause,
    );
    final BooleanBaseResponse baseResponse = BooleanBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Shocker not found or does not belong to you';
    }

    return baseResponse;
  }

  /// Control a shocker
  Future<ObjectBaseResponse> control({ List<ShockerControl>? shocks, String? name }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/2/shockers/control',
      data: <String, dynamic>{
        'shocks': shocks?.map((ShockerControl control) => control.toJson()).toList() ?? List<ShockerControl>.empty(),
        'customName': name,
      },
    );
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    return baseResponse;
  }

  /// Get the logs for a shocker
  Future<List<ControlLogEntry>> logs(String id, { int offset = 0, int limit = 100 }) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>(
      '/1/shockers/$id/logs',
      queryParameters: <String, dynamic>{
        'offset': offset,
        'limit': limit,
      },
    );

    final ControlLogResponseBaseResponse baseResponse = ControlLogResponseBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Shocker does not exist';
    }

    return baseResponse.data!;
  }

  /// Get sharing information of a shocker
  Future<List<SharedShockerInfo>> shares(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/shockers/$id/shares');
    final SharedShockerInfoBaseResponse baseResponse = SharedShockerInfoBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse.data ?? List<SharedShockerInfo>.empty();
  }

  /// Share a shocker
  Future<GuidBaseResponse> share(String id, { required ShockerLimits limits, required ShockerPermissions permissions }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/shockers/$id/shares',
      data: <String, dynamic>{
        'permissions': permissions.toJson(),
        'limits': limits.toJson(),
      },
    );
    final GuidBaseResponse baseResponse = GuidBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse;
  }

  /// Get shockers share codes
  Future<List<SharedShockerCode>> codes(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/shockers/$id/shareCodes');
    final SharedShockerCodeBaseResponse baseResponse = SharedShockerCodeBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse.data ?? List<SharedShockerCode>.empty();
  }

  /// Unshare a shocker
  Future<ObjectBaseResponse> unshare(String id, String who) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/shockers/$id/shares/$who');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse;
  }

  /// Update a shared shocker info
  Future<ObjectBaseResponse> updateShare(String id, String who, { required ShockerPermissions permissions, required ShockerLimits limits }) async {
    final Response<OpenShockResponse> response = await _openShock.client.patch<OpenShockResponse>(
      '/1/shockers/$id/shares/$who',
      data: <String, dynamic>{
        'permissions': permissions.toJson(),
        'limits': limits.toJson(),
      },
    );
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse;
  }

  /// Pause or unpause a shared shocker
  Future<ObjectBaseResponse> pauseShare(String id, String who, { required bool pause }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/shockers/$id/shares/$who/pause',
      data: pause,
    );
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Device does not exists or you do not have access to it';
    }

    return baseResponse;
  }
}
