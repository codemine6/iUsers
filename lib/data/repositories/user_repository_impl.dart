import 'package:iusers/data/sources/remote/user_remote_source.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteSource userRemoteSource;

  UserRepositoryImpl(this.userRemoteSource);

  @override
  Future<List<UserEntity>> getAllUsers() {
    return userRemoteSource.getAllUsers();
  }

  @override
  Future<void> deleteUser(int id) {
    return userRemoteSource.deleteUser(id);
  }

  @override
  Future<void> addNewUser(UserEntity user) {
    return userRemoteSource.addNewUser(user);
  }

  @override
  Future<void> updateUser(int id, UserEntity user) {
    return userRemoteSource.updateUser(id, user);
  }
}
