class GlobalStates<T> {
  final Status _status;
  final T? _data;
  final String? error;

  GlobalStates.initial()
      : _status = Status.initial,
        _data = null,
        error = null;

  GlobalStates.success(T data)
      : _status = Status.success,
        _data = data,
        error = null;

  GlobalStates.fail([this.error])
      : _status = Status.fail,
        _data = null;

  GlobalStates.loading()
      : _status = Status.loading,
        _data = null,
        error = null;

  GlobalStates.empty()
      : _status = Status.empty,
        _data = null,
        error = null;

  Status get status => _status;

  bool get isSuccess => _status == Status.success;

  bool get isInitial => _status == Status.initial;

  bool get isLoading => _status == Status.loading;

  bool get isFailed => _status == Status.fail;

  bool get isEmpty => _status == Status.empty;

  T? getData({
    T? Function()? onDataAbsence,
  }) =>
      isSuccess ? _data : onDataAbsence?.call();

  String? getError() => isFailed ? error : null;

  R when<R>({
    R Function()? initial,
    R Function()? empty,
    required R Function(T data) data,
    required R Function() loading,
    required R Function(String error) error,
  }) {
    switch (_status) {
      case Status.initial:
        return initial != null ? initial() : loading();
      case Status.empty:
        return empty != null ? empty() : loading();
      case Status.success:
        return data(_data as T);
      case Status.fail:
        return error(this.error ?? "something wrong");
      case Status.loading:
        return loading();
    }
  }
}

enum Status {
  initial,
  success,
  fail,
  empty,
  loading;

  R when<R>({
    R Function()? initial,
    required R Function() success,
    required R Function() fail,
    R Function()? empty,
    required R Function() loading,
  }) {
    switch (this) {
      case Status.initial:
        return initial != null ? initial() : loading();
      case Status.empty:
        return empty != null ? empty() : loading();
      case Status.success:
        return success();
      case Status.fail:
        return fail();
      case Status.loading:
        return loading();
    }
  }
}
