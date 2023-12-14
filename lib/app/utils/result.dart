
sealed class Result<T> {
  const Result();

  static Result<T> guard<T>(T Function() call) {
    try {
      //Try to execute the unction
      return Success(value: call());
    } on Exception catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() call) async {
    try {
      //Try to execute the unction
      return Success(value: await call());
    } on Exception catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

   bool isSuccess() => this is Success ? true : false;
}

final class Success<T> extends Result<T> {
  const Success({required this.value});

  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure({required this.errorMessage});

  final String errorMessage;
}
