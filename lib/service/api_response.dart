class ApiResponse<T> {
  late Status status;
  late T? data;
  late String message;

  loading(String message) {
    this.message = message;
    status = Status.loading;
  }

  completed(T data, {String message = ""} ) {
    this.message = message;
    this.data = data;
    status = Status.completed;
  }

  error(String message) {
    this.message = message;
    status = Status.error;
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, completed, error }
