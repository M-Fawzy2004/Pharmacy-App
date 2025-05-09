import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/errors/failures.dart';
import 'package:pharmacy_app/feature/auth/data/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit(this.authRepository) : super(SignInInitial());

  // Sign In
  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());

    final Either<Failures, void> result = await authRepository.signIn(
      email,
      password,
    );

    result.fold(
      (failure) => emit(
        SignInFailure(failure.message),
      ),
      (_) => emit(SignInSuccess()),
    );
  }

  // Sign In With Google
  Future<void> signInWithGoogle() async {
    emit(SignInLoading());

    final Either<Failures, void> result =
        await authRepository.signInWithGoogle();

    result.fold(
      (failure) => emit(
        SignInFailure(failure.message),
      ),
      (_) => emit(SignInSuccess()),
    );
  }
}
