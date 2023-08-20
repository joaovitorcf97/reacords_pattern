import 'package:reacords_pattern/model/user_model.dart';
import 'package:reacords_pattern/repository/user_exception.dart';
import 'package:reacords_pattern/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<(UserException?, UserModel?)> getAll() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = UserModel(name: 'João');
    return (null, user);
  }

  @override
  Future<(UserException?, UserModel?)> getError() async {
    await Future.delayed(const Duration(seconds: 2));
    return (UserRepositoryException(message: 'Erro qualquer'), null);
  }

  @override
  Future<(UserException?, UserModel?)> getErrorNotFound() async {
    await Future.delayed(const Duration(seconds: 2));
    return (UserNotFoundException(), null);
  }
}
