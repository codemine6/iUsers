import 'package:iusers/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int? id;
  final String? bio;
  final String? email;
  final String? phone;
  final String? profileUrl;
  final String? username;

  const UserModel({
    this.id,
    this.bio,
    this.email,
    this.phone,
    this.profileUrl,
    this.username,
  }) : super(
          id: id,
          bio: bio,
          email: email,
          phone: phone,
          profileUrl: profileUrl,
          username: username,
        );

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      bio: data['bio'],
      email: data['email'],
      phone: data['phone'],
      profileUrl: data['profile_url'],
      username: data['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        'bio': bio,
        'email': email,
        'phone': phone,
        'profile_url': profileUrl,
        'username': username,
      };
}
