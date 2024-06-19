import 'dart:async';

typedef JsonMap<V extends dynamic> = Map<String, V>;
typedef FutureCallback = Future<void> Function();
typedef FutureOrCallback = FutureOr<void> Function();
typedef ValueConvertor<R, A> = R Function(A value);
