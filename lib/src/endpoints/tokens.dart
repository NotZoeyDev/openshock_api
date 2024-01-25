import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:openshock_api/openshock_api.dart';

class Tokens {
  Tokens(this._openShock);

  /// The current [OpenShock] instance
  final OpenShock _openShock;

  /// The [validUntil] parameter for tokens doesn't use a standard datetime format so I have to manulaly format it, thanks Luc.
  String formatDate(DateTime time) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(time);
  }

  /// Get all the tokens for the current user
  Future<List<TokenResponse>> all() async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/tokens');
    final TokensResponseBaseResponse baseResponse = TokensResponseBaseResponse.fromJson(response.data!);

    return baseResponse.data ?? List<TokenResponse>.empty();
  }

  /// Create a new token
  Future<StringBaseResponse> create({ String? name, List<PermissionType>? permissions, DateTime? validUntil }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/tokens',
      data: <String, dynamic>{
        'name': name,
        'permissions': permissions?.map((PermissionType permissionType) => permissionType.index).toList() ?? <int>[],
        'validUntil': validUntil != null ? formatDate(validUntil) : null,
      },
    );
    final StringBaseResponse baseResponse = StringBaseResponse.fromJson(response.data!);

    return baseResponse;
  }

  /// Get a token by id
  Future<TokenResponse> get(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.get<OpenShockResponse>('/1/tokens/$id');
    final TokenResponseBaseResponse baseResponse = TokenResponseBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'The token does not exist or you do not have access to it';
    }

    return baseResponse.data!;
  }

  /// Delete a token by id
  Future<ObjectBaseResponse> delete(String id) async {
    final Response<OpenShockResponse> response = await _openShock.client.delete<OpenShockResponse>('/1/tokens/$id');
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'The token does not exist or you do not have access to it';
    }

    return baseResponse;
  }

  /// Edit a token by id
  Future<ObjectBaseResponse> update(String id, { String? name, List<PermissionType>? permissions }) async {
    final Response<OpenShockResponse> response = await _openShock.client.post<OpenShockResponse>(
      '/1/tokens',
      data: <String, dynamic>{
        'name': name,
        'permissions': permissions?.map((PermissionType permissionType) => permissionType.index).toList() ?? <int>[],
      },
    );
    final ObjectBaseResponse baseResponse = ObjectBaseResponse.fromJson(response.data!);

    switch (response.statusCode) {
      case 404:
        throw baseResponse.message ?? 'The token does not exist or you do not have access to it';
    }

    return baseResponse;
  }
}
