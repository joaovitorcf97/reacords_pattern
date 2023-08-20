import 'package:bloc/bloc.dart';
import 'package:reacords_pattern/core/either.dart';
import 'package:reacords_pattern/home/home_state.dart';
import 'package:reacords_pattern/repository/user_exception.dart';
import 'package:reacords_pattern/repository/user_repository.dart';
import 'package:reacords_pattern/repository/user_repository_impl.dart';

import '../model/user_model.dart';

class HomeController extends Cubit<HomeState> {
  final UserRepository _repository = UserRepositoryImpl();

  HomeController() : super(HomeInitial());

  Future<void> fazerQualquerCoisa() async {
    emit(HomeLoading());
    final result = await _repository.getAll();

    Either.map<UserException?, UserModel?>(
      result,
      (exception) {
        switch (exception) {
          case UserRepositoryException(message: final message):
            emit(HomeError(message: message));
          case UserNotFoundException():
            emit(HomeError(message: 'Usuário não encontrado'));
          case null:
        }
      },
      (user) {
        emit(HomeLoaded(name: user!.name));
      },
    );
  }

  Future<void> error() async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeError(message: 'Deu erro!'));
  }
}
