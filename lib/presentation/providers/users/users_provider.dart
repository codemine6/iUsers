import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/domain/module.dart';
import 'package:iusers/presentation/providers/users/users_state.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  return UsersNotifier(ref);
});

class UsersNotifier extends StateNotifier<UsersState> {
  final Ref ref;

  UsersNotifier(this.ref) : super(UsersInitial()) {
    getAllUsers();
  }

  getAllUsers() async {
    state = UsersLoading();
    final users = await ref.read(getAllUsersUseCaseProvider).getAllUsers();
    state = UsersLoaded(users);
  }

  searchUser(String query) async {
    state = UsersLoading();
    final data = await ref.read(getAllUsersUseCaseProvider).getAllUsers();
    final results = data
        .where((element) =>
            element.username!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = UsersLoaded(results);
  }
}
