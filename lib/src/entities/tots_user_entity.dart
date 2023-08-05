import 'dart:convert';

class TotsUser {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  int? role;
  String? photo;
  String? phone;

  TotsUser({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.role,
    this.phone,
    this.photo
  });

  factory TotsUser.fromJson(Map<String, dynamic> json) {
    return TotsUser(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      role: json['role'] is String ? int.parse(json['role']) : json['role'],
      photo: json['photo'],
      phone: json['phone']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'role': role,
      'photo': photo,
      'phone': phone
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}