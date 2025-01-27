import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password, String? name}) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password,);
    result.fold(
      (failuer) => emit(LoginFailuer(failuer.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  //sign in with google
  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failuer) => emit(LoginFailuer(failuer.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  //sign in with facebook
  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failuer) => emit(LoginFailuer(failuer.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  //sign in with apple
  Future<void> signInWithApple() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithApple();
    result.fold(
      (failuer) => emit(LoginFailuer(failuer.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
