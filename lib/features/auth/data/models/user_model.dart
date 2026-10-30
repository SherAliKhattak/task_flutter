import 'package:flutter_assignment_upwork/features/auth/domain/entities/user.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.image,
  });

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String? image;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final username = json['username'];
    if (id is! num || username is! String || username.isEmpty) {
      throw const FormatException('User payload is incomplete.');
    }
    return UserModel(
      id: id.toInt(),
      username: username,
      email: json['email'] is String ? json['email'] as String : '',
      firstName: json['firstName'] is String ? json['firstName'] as String : '',
      lastName: json['lastName'] is String ? json['lastName'] as String : '',
      image: json['image'] is String ? json['image'] as String : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'image': image,
  };

  User toEntity() {
    return User(
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      image: image,
    );
  }
}

class AuthSessionModel {
  const AuthSessionModel({
    required this.user,
    required this.accessToken,
    this.refreshToken,
  });

  final UserModel user;
  final String accessToken;
  final String? refreshToken;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    final accessToken = json['accessToken'];
    if (accessToken is! String || accessToken.isEmpty) {
      throw const FormatException('Missing access token.');
    }
    final refreshToken = json['refreshToken'];
    return AuthSessionModel(
      user: UserModel.fromJson(json),
      accessToken: accessToken,
      refreshToken: refreshToken is String && refreshToken.isNotEmpty
          ? refreshToken
          : null,
    );
  }
}
