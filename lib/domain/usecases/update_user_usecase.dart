import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository userRepository;

  UpdateUserUseCase(this.userRepository);

  Future<void> updateUser(int id, UserEntity user) {
    return userRepository.updateUser(id, user);
  }
}
