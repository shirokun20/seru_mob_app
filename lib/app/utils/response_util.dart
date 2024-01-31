class ResponseUtil<T> {
  Function(T) onSuccess;
  Function onFailed;
  Function onDone;

  ResponseUtil({
    required this.onSuccess,
    required this.onFailed,
    required this.onDone,
  });
}
