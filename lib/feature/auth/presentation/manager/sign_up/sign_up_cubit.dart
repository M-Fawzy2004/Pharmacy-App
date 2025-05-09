import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/errors/failures.dart';
import 'package:pharmacy_app/feature/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepository) : super(SignUpInitial());

  final AuthRepository authRepository;

  Future<void> signUp( String email, String password) async {
    emit(SignUpLoading());

    final Either<Failures, void> result = await authRepository.signUp(
      email,
      password,
    );

    result.fold(
      (failure) => emit(
        SignUpFailure(failure.message),
      ),
      (_) => emit(SignUpSuccess()),
    );
  }
}
