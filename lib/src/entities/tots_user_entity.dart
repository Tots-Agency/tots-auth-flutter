import 'dart:convert';

class TotsUser {
  int? id;
  String? firstname;
  String? lastname;
  String? email;

  TotsUser({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
  });

  factory TotsUser.fromJson(Map<String, dynamic> json) {
    return TotsUser(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}