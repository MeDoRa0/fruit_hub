import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failuers, UserEntity>> createUserWithEmailAndPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
