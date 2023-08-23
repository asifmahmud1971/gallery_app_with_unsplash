import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:unsplash_gallery/core/app/app_dependency.dart';
import 'package:unsplash_gallery/core/app/app_preference.dart';
import 'package:unsplash_gallery/data/network/api_urls.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";
const String authorization = "Authorization";

enum Method { get, post, put, delete, patch }

@Injectable()
class ApiClient {
  final AppPreferences _appPreferences;
  final Dio _dio;

  ApiClient(this._dio) : _appPreferences = instance.get() {
    initInterceptors();
  }

  void initInterceptors() {
    _dio.options.baseUrl = ApiUrls.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          Map<String, dynamic> header = <String, dynamic>{};
          header[contentType] = applicationJson;
          header[accept] = applicationJson;
          String token = await _appPreferences.getUserAccessToken();
          if (token.isNotEmpty) {
            header[authorization] = "Bearer $token";
          }
          options.headers = header;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          log('Status Code: ${err.response?.statusCode} Error Data: ${err.response?.data}');
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    FormData? formData,
    bool isMultipart = false,
  }) async {
    Response response;
    log('[${method.name.toUpperCase()}${isMultipart ? '-MULTIPART' : ''}] Request url ======> ${_dio.options.baseUrl}$url');
    log('Request params ======> ${isMultipart ? (formData!.fields.toString() + formData.files.toString()) : params}');
    try {
      if (method == Method.post) {
        if (isMultipart && formData != null) {
          response = await _dio.post(url, data: formData);
        } else {
          response = await _dio.post(url, data: params);
        }
      } else if (method == Method.delete) {
        response = await _dio.delete(url);
      } else if (method == Method.put) {
        response = await _dio.put(url, data: params);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }
      log('[$url] [${response.statusCode}] Request response =========> ${response.data}');
      return response.data;
    } on DioError catch (error, stackTrace) {
      log('$error');
      log('$stackTrace');
      rethrow;
    }
  }
}
