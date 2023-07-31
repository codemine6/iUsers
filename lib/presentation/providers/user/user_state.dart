import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserCreated extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDeleted extends UserState {
  @override
  List<Object?> get props => [];
}

class UserUpdated extends UserState {
  @override
  List<Object?> get props => [];
}
