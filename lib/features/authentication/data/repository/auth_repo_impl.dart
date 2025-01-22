import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/authentication/data/models/user_model.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  //create user with email and password
  Future<Either<Failuers, UserEntity>> createUserWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(
        UserModel.fromFirebase(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailuer(message: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.create user with email and password: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  //sign in with email and password
  Future<Either<Failuers, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      return Right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailuer(message: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.sign in with email and password: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

//sign in with google
  @override
  Future<Either<Failuers, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebase(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.sign in with google: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }
}
