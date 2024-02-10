import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://tokyo-backender.org.kg',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  Future<void> setup() async {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      requestBody: true,
      responseBody: true,
    );

    interceptors.add(logInterceptor);

    interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.extra['requiresToken'] == true) {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('TOKEN_KEY');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        return handler.next(error);
      },
    ));

    if (kDebugMode) {
      interceptors.add(logInterceptor);
    }
  }
}
