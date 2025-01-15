import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

// SignupCubit
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;
  // Create user with email and password
  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    // Emit loading state
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    // Check if the result is a failure or success
    result.fold(
      // If it's a failure emit SignupFailuer state
      (failuer) => emit(
        SignupFailuer(
          message: failuer.message,
        ),
      ),
      // If it's a success emit SignupSuccess state
      (userEntity) => emit(
        SignupSuccess(
          userEntity: userEntity,
        ),
      ),
    );
  }
}
