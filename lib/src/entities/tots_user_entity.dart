import 'dart:convert';

class TotsUser {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  int? role;
  String? photo;
  String? phone;
  int? status;

  TotsUser({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.role,
    this.phone,
    this.photo,
    this.status
  });

  factory TotsUser.fromJson(Map<String, dynamic> json) {
    return TotsUser(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      role: json['role'] is String ? int.parse(json['role']) : json['role'],
      photo: json['photo'],
      phone: json['phone'],
      status: json['status'] is String ? int.parse(json['status']) : json['status'],
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
      'phone': phone,
      'status': status,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}