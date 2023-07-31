import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/data/module.dart';
import 'package:iusers/domain/usecases/add_new_user_usecase.dart';
import 'package:iusers/domain/usecases/delete_user_usecase.dart';
import 'package:iusers/domain/usecases/get_all_users_usecase.dart';
import 'package:iusers/domain/usecases/update_user_usecase.dart';

final addNewUserUseCaseProvider =
    Provider((ref) => AddNewUserUseCase(ref.watch(userRepositoryProvider)));
final deleteUserUseCaseProvider =
    Provider((ref) => DeleteUserUseCase(ref.watch(userRepositoryProvider)));
final getAllUsersUseCaseProvider =
    Provider((ref) => GetAllUsersUseCase(ref.watch(userRepositoryProvider)));
final updateUserUseCaseProvider =
    Provider((ref) => UpdateUserUseCase(ref.watch(userRepositoryProvider)));
