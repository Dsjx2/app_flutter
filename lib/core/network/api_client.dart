import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient(this.dio);

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) =>
      dio.get(path, queryParameters: queryParameters);

  Future<Response> post(String path, {Map<String, dynamic>? data}) =>
      dio.post(path, data: data);

  Future<Response> put(String path, {Map<String, dynamic>? data}) =>
      dio.put(path, data: data);

  Future<Response> delete(String path) => dio.delete(path);
}
