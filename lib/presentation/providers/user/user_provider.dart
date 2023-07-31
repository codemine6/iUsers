import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/domain/module.dart';
import 'package:iusers/presentation/providers/user/user_state.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref);
});

class UserNotifier extends StateNotifier<UserState> {
  final Ref ref;

  UserNotifier(this.ref) : super(UserInitial());

  addNewUser(UserEntity user) async {
    state = UserLoading();
    await ref.read(addNewUserUseCaseProvider).addNewUser(user);
    state = UserCreated();
  }

  deleteUser(int id) async {
    await ref.read(deleteUserUseCaseProvider).deleteUser(id);
    state = UserDeleted();
  }

  updateUser(int id, UserEntity user) async {
    state = UserLoading();
    await ref.read(updateUserUseCaseProvider).updateUser(id, user);
    state = UserUpdated();
  }
}
