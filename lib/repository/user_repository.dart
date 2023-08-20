import 'package:reacords_pattern/model/user_model.dart';
import 'package:reacords_pattern/repository/user_exception.dart';

abstract interface class UserRepository {
  Future<(UserException?, UserModel?)> getAll();
  Future<(UserException?, UserModel?)> getErrorNotFound();
  Future<(UserException?, UserModel?)> getError();
}
