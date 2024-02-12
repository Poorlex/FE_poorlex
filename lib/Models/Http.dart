class HttpError {
  String message;
  HttpError({
    required this.message
  });
}

class HttpResult<T> {
  bool success;
  T? data;
  HttpError? error;

  HttpResult({
    this.data,
    this.error,
    required this.success,
  });
}