import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/domain/repositories/user_repository.dart';

class AddNewUserUseCase {
  final UserRepository userRepository;

  AddNewUserUseCase(this.userRepository);

  Future<void> addNewUser(UserEntity user) {
    return userRepository.addNewUser(user);
  }
}
