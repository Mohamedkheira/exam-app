
enum Status { loading, success, error ,initial}

class Resource<T> {
  final Status status;
  T? data;
  String? error;
  Resource({required this.status, this.data, this.error});

  factory Resource.success(T? data) {
    return Resource<T>(status: Status.success, data: data);
  }
  factory Resource.loading() {
    return Resource<T>(status: Status.loading);
  }
  factory Resource.error(String error) {
    return Resource<T>(status: Status.error, error: error);
  }
  factory Resource.initial() {
    return Resource<T>(status: Status.initial);
  }
}
