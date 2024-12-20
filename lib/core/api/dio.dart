import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/di/modules/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

@Injectable()
class ApiClient {
  final AppSharedPreferences _sp;
  ApiClient(this._sp);
  final options = BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 12),
    receiveTimeout: const Duration(seconds: 15),
  );

  Dio getDio() {
    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _sp.getString('accessToken');
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['CLIENT_KEY'] = dotenv.env['CLIENT_KEY'];
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
    return dio;
  }

  Future<Response> get(String url) async {
    final dio = getDio();
    final dir = await getTemporaryDirectory();
    var cacheOptions = CacheOptions(
        keyBuilder: (request) => request.uri.toString(),
        store: FileCacheStore(dir.path),
        policy: CachePolicy.refresh);
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    return dio.get(url);
  }

  Future<Response> post(String url, dynamic data) async {
    final dio = getDio();
    return dio.post(url, data: data);
  }

  Future<Response> put(String url, dynamic data) async {
    final dio = getDio();
    return dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    final dio = getDio();
    return dio.delete(url);
  }

  Future<Response> patch(String url, dynamic data) async {
    final dio = getDio();
    return dio.patch(url, data: data);
  }
}
