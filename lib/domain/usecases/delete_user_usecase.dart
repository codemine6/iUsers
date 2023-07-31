import 'package:iusers/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository userRepository;

  DeleteUserUseCase(this.userRepository);

  Future<void> deleteUser(int id) {
    return userRepository.deleteUser(id);
  }
}
