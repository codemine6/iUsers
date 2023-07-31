import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/data/repositories/user_repository_impl.dart';
import 'package:iusers/data/sources/remote/user_remote_source_impl.dart';

final userRemoteSourceProvider = Provider((ref) => UserRemoteSourceImpl(Dio()));
final userRepositoryProvider =
    Provider((ref) => UserRepositoryImpl(ref.watch(userRemoteSourceProvider)));
