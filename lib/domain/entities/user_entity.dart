import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? bio;
  final String? email;
  final String? phone;
  final String? profileUrl;
  final String? username;

  const UserEntity({
    this.id,
    this.bio,
    this.email,
    this.phone,
    this.profileUrl,
    this.username,
  });

  @override
  List<Object?> get props => [
        id,
        bio,
        email,
        phone,
        profileUrl,
        username,
      ];
}
