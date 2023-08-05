import 'package:tots_auth/src/entities/tots_user_entity.dart';

class TotsToken extends TotsUser {
  String? tokenType;
  String? accessToken;

  TotsToken({
    this.tokenType,
    this.accessToken,
  });

  factory TotsToken.fromJson(Map<String, dynamic> json) {
    TotsToken row = TotsToken(
      tokenType: json['token_type'],
      accessToken: json['access_token'],
    );
    row.id = json['id'];
    row.firstname = json['firstname'];
    row.lastname = json['lastname'];
    row.email = json['email'];
    row.role = json['role'] is String ? int.parse(json['role']) : json['role'];
    row.photo = json['photo'];
    row.phone = json['phone'];
    return row;
  }
}