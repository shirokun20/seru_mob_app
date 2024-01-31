abstract class BaseUIState {}
class BaseUILoadSuccess<T> extends BaseUIState {
  final T data;
  BaseUILoadSuccess(this.data);
}
class BaseUILoading extends BaseUIState {}
class BaseUIIdle extends BaseUIState {}
class BaseUIError extends BaseUIState {}
class BaseUIEmpty extends BaseUIState {}