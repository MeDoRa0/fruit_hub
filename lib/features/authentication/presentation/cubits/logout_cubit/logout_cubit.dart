import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/authentication/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepo) : super(LogoutInitial());

  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await authRepo.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
