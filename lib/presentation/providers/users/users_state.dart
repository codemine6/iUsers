import 'package:equatable/equatable.dart';
import 'package:iusers/domain/entities/user_entity.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoading extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;

  const UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}
