mixin FutureUseCase<T, P> {
  Future<T> call({P? params});
}
