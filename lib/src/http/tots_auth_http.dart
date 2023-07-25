import 'package:dio/dio.dart';
import 'package:tots_auth/src/entities/tots_token_entity.dart';
import 'package:tots_auth/tots_auth.dart';
import 'package:tots_core/tots_core.dart';

class TotsAuthHttp {

  static Future<TotsToken> login(String email, String password) async {

    try {
      final response = await TotsHttp.instance.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode != 200) {
        throw Exception('Auth login error 1');
      }

      TotsToken data = TotsToken.fromJson(response.data);
      TotsAuth.saveBearerToken(data.accessToken!);
      TotsAuth.saveUser(data);

      return data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<bool> verifyIfExistEmail(String email) async {

    try {
      final response = await TotsHttp.instance.post('/auth/verify-if-exist-email', data: {
        'email': email
      });

      if (response.statusCode != 200) {
        throw Exception('Error Verify if exist email');
      }

      return response.data['exist'];
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}