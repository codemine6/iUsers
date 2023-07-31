import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/domain/repositories/user_repository.dart';

class GetAllUsersUseCase {
  final UserRepository userRepository;

  GetAllUsersUseCase(this.userRepository);

  Future<List<UserEntity>> getAllUsers() {
    return userRepository.getAllUsers();
  }
}
