abstract class BaseUseCaseWithParams<T, P> {
  Future<T> call({required P params});
}

abstract class BaseUseCase<T> {
  Future<T> call();
}
