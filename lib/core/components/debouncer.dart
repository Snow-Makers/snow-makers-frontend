import 'dart:async';
import 'dart:ui';

class Debouncer {
  VoidCallback action;
  static Timer? _timer;

  Debouncer({required this.action});

  static run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 2000), action);
  }
}
