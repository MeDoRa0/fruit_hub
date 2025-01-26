import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/authentication/data/models/user_model.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  //create user with email and password
  Future<Either<Failuers, UserEntity>> createUserWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel.fromFirebase(user);
      await addUserData(user: userEntity);

      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailuer(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('Exception in AuthRepoImpl.create user with email and password: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  //sign in with email and password
  Future<Either<Failuers, UserEntity>> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
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

  @override
  Future<Either<Failuers, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebase(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.sign in with facebook: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  Future<Either<Failuers, UserEntity>> signInWithApple() async {
    try {
      var user = await firebaseAuthService.signInWithApple();
      return Right(UserModel.fromFirebase(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.sign in with apple: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }
}
