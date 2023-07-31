import 'package:dio/dio.dart';
import 'package:iusers/common/constants.dart';
import 'package:iusers/data/models/user_model.dart';
import 'package:iusers/data/sources/remote/user_remote_source.dart';
import 'package:iusers/domain/entities/user_entity.dart';

class UserRemoteSourceImpl implements UserRemoteSource {
  final Dio dio;

  UserRemoteSourceImpl(this.dio);

  @override
  Future<void> addNewUser(UserEntity user) async {
    try {
      final data = UserModel(
        bio: user.bio,
        email: user.email,
        phone: user.phone,
        profileUrl: user.profileUrl,
        username: user.username,
      ).toJson();
      await dio.post('$baseUrl/users', data: data);
    } catch (e) {}
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      await dio.delete('$baseUrl/users/$id');
    } catch (e) {}
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    try {
      final res = await dio.get('$baseUrl/users');
      final data = res.data['data'] as List;
      final result =
          data.map((e) => UserModel.fromJson(e)).toList().reversed.toList();
      return result;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> updateUser(int id, UserEntity user) async {
    try {
      final data = UserModel(
        bio: user.bio,
        email: user.email,
        phone: user.phone,
        profileUrl: user.profileUrl,
        username: user.username,
      ).toJson();
      await dio.post('$baseUrl/users/$id', data: data);
    } catch (e) {}
  }
}
