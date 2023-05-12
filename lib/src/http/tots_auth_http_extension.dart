import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tots_auth/src/http/tots_auth_interceptor.dart';
import 'package:tots_core/tots_core.dart';

extension TotsAuthHttpExtension on TotsHttp {

  static void configureAuth() {
    // Configuraciones generales
    TotsHttp.instance.options.baseUrl = dotenv.env['API_BASE_URL']!;
    //_dio.options.connectTimeout = 5000; // 5 segundos
    //_dio.options.receiveTimeout = 5000; // 5 segundos

    // Interceptores
    TotsHttp.instance.interceptors.add(TotsAuthInterceptor());
    // Agrega aquí cualquier otro interceptor que desees utilizar
  }

}