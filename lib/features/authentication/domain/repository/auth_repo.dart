import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failuers, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failuers, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failuers, UserEntity>> signInWithGoogle();
  Future<Either<Failuers, UserEntity>> signInWithFacebook();

  Future<Either<Failuers, UserEntity>> signInWithApple();

  Future addUserData({required UserEntity user});
}
