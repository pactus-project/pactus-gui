abstract class BaseGrpcWithParamsService<P, R> {
  Future<R> service(P params);
}

abstract class BaseGrpcService<R> {
  Future<R> service();
}
