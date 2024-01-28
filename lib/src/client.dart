import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:openshock_api/openshock_api.dart';

typedef OpenShockResponse = Map<String, dynamic>;

class OpenShock {
  OpenShock({ String baseUrl = 'https://api.shocklink.net' }) {
    _baseUrl = baseUrl;
    createClient();

    _account = Account(this);
    _devices = Devices(this);
    _links = Links(this);
    _shockers = Shockers(this);
    _shares = Shares(this);
    _tokens = Tokens(this);
    _users = Users(this);
    _version = Version(this);
  }

  /// Create our Dio instance/client
  void createClient() {
    _client = Dio();

    // Add cookie support
    _client.interceptors.add(CookieManager(CookieJar()));

    _client.options.baseUrl = _baseUrl;
    _client.options.validateStatus = (_) => true;

    // Add the token to the header if it's set
    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        if (_token != null && _token!.isNotEmpty) {
          options.headers['OpenShockToken'] = _token;
        }

        return handler.next(options);
      },
    ),);
  }
  
  /// Base URL for the api
  late String _baseUrl;
  String get baseUrl => _baseUrl;

  /// User token used for api endpoints
  String? _token;

  /// Set the token
  void setToken(String? token) {
    _token = token;
  }

  /// Dio instance used for requests
  late Dio _client;
  Dio get client => _client;

  /// Access to [Account]
  late Account _account;
  Account get account => _account;

  /// Access to [Devices]
  late Devices _devices;
  Devices get devices => _devices;

  /// Access to [Links]
  late Links _links;
  Links get links => _links;

  /// Access to [Shockers]
  late Shockers _shockers;
  Shockers get shockers => _shockers;

  /// Access to [Shares]
  late Shares _shares;
  Shares get shares => _shares;

  /// Access to [Tokens]
  late Tokens _tokens;
  Tokens get tokens => _tokens;

  /// Access to [Users]
  late Users _users;
  Users get users => _users;

  /// Access to [Version]
  late Version _version;
  Version get version => _version;
}
