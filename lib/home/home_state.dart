sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String name;

  HomeLoaded({required this.name});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
