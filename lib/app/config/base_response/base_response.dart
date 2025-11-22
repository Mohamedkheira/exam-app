sealed class BaseResponse<T> {}

class SuccessResponse<T> extends BaseResponse {
  final T data;
  SuccessResponse({required this.data});
}

class ErrorResponse<T> extends BaseResponse {
  final Exception message;
  ErrorResponse({required this.message});
}
