import 'package:dio/dio.dart';
import 'package:openshock_api/openshock_api.dart';

class Links {
  Links(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// Add a shocker to a share link
  Future<ObjectBaseResponse> link(String id, String shocker) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>('/1/shares/links/$id/$shocker');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Share link or shocker does not exist';

      case 409:
        throw baseResponse.message ?? 'Shocker already exists in share link';
    }

    return baseResponse;
  }

  /// Remove a shocker from a share link
  Future<ObjectBaseResponse> unlink(String id,  String shocker) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/shares/links/$id/$shocker');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 400:
        throw baseResponse.message ?? 'Shocker does not exist in share link';

      case 404:
        throw baseResponse.message ?? 'Share link or shocker does not exist';
    }

    return baseResponse;
  }

  /// Update a shocker in a share link
  Future<ShareLinkResponse> update(String id, String shocker, { required ShockerPermissions permissions, required ShockerLimits limits, int? cooldown }) async {
    final Response<OpenShockResponse> response = await _openShock.client.patch<OpenShockResponse>(
      '/1/shares/links/$id/$shocker',
      data: <String, dynamic>{
        'permissions': permissions.toJson(),
        'limits': limits.toJson(),
        'cooldown': cooldown,
      },
    );

    final ShareLinkResponseBaseResponse baseResponse = ShareLinkResponseBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 400:
        throw baseResponse.message ?? 'Shocker does not exist in share link';

      case 404:
        throw baseResponse.message ?? 'Share link or shocker does not exist';
    }

    return baseResponse.data!;
  }

  /// Create a share link
  Future<GuidBaseResponse> create({ String? name, DateTime? expiresOn }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/shares/links',
      data: {
        'name': name,
        'expiresOn': expiresOn?.toIso8601String(),
      },
    );
    final GuidBaseResponse baseResponse = GuidBaseResponse.fromJson(response.data!);

    return baseResponse;
  }

  /// Get all share links
  Future<List<ShareLinkResponse>> all() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/shares/links');
    final ShareLinksResponseBaseResponse baseResponse = ShareLinksResponseBaseResponse.fromJson(response.data!);

    return baseResponse.data ?? List<ShareLinkResponse>.empty();
  }

  /// Delete a share link
  Future<ObjectBaseResponse> delete(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/shares/links/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'Share link not found or does not belong to you';
    }

    return baseResponse.data!;
  }

  /// Pause a share link
  Future<PauseReasonBaseResponse> pause(String id, String shocker, { bool pause = true }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/shares/links/$id/$shocker/pause',
      data: <String, dynamic>{
        'pause': pause,
      },
    );
    final PauseReasonBaseResponse baseResponse = PauseReasonBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 400:
        throw baseResponse.message ?? 'Shocker does not exist in share link';

      case 404:
        throw baseResponse.message ?? 'Share link or shocker does not exist';
    }

    return baseResponse;
  }
}
