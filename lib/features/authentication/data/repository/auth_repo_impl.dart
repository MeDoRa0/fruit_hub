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
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);

      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailuer(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.create user with email and password: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

//delete user
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  //sign in with email and password
  Future<Either<Failuers, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      //sign in with email and password
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
//fetch user data
      var userEntity = await fetchUserData(
        uId: user.uid,
      );
//return user entity
      return Right(
        userEntity,
      );
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, docID: user.uid);
      if (isUserExist) {
        await fetchUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.sign in with google: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuers, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, docID: user.uid);
      if (isUserExist) {
        await fetchUserData(uId: user.uid);
      } else {
        await fetchUserData(uId: user.uid);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.sign in with facebook: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuers, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, docID: user.uid);
      if (isUserExist) {
        await fetchUserData(uId: user.uid);
      } else {
        await fetchUserData(uId: user.uid);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.sign in with apple: ${e.toString()}');
      return left(ServerFailuer(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      docID: user.uId,
    );
  }

  @override
  Future<UserEntity> fetchUserData({required String uId}) async {
    var userData = await databaseService.fetchData(
        path: BackendEndpoint.fetchUserData, docID: uId);
    return UserModel.fromMap(userData);
  }
}
