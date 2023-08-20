sealed class UserException implements Exception {}

class UserNotFoundException extends UserException {}

class UserRepositoryException extends UserException {
  final String message;

  UserRepositoryException({
    required this.message,
  });
}
