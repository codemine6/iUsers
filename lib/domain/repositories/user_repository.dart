import 'package:iusers/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> addNewUser(UserEntity user);
  Future<void> deleteUser(int id);
  Future<List<UserEntity>> getAllUsers();
  Future<void> updateUser(int id, UserEntity user);
}
