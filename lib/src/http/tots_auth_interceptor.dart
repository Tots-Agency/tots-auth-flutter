import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tots_auth/src/tots_auth.dart';

class TotsAuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Verificar si la URL del request coincide con la URL de la API
    if (options.baseUrl != dotenv.env['API_BASE_URL']) {
      super.onRequest(options, handler);
      return;
    }

    // Obtener token del usuario si se encuentra logueado
    String? token = await TotsAuth.getBearerToken();
    if(token != null){
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    super.onRequest(options, handler);
  }

  /*@override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }*/
  
}