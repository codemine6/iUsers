import 'package:iusers/domain/entities/user_entity.dart';

abstract class UserRemoteSource {
  Future<void> addNewUser(UserEntity user);
  Future<void> deleteUser(int id);
  Future<List<UserEntity>> getAllUsers();
  Future<void> updateUser(int id, UserEntity user);
}
