import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InheritedWidgetRef extends ConsumerStatefulWidget {
  final Widget child;

  const InheritedWidgetRef({super.key, required this.child});

  @override
  ConsumerState<InheritedWidgetRef> createState() => _InheritedWidgetRefState();

  static WidgetRef of(BuildContext context) {
    return maybeOf(context)!;
  }

  static WidgetRef? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedWidgetRef>()
        ?.ref;
  }
}

class _InheritedWidgetRefState extends ConsumerState<InheritedWidgetRef> {
  @override
  Widget build(BuildContext context) {
    return _InheritedWidgetRef(
      ref: ref,
      child: widget.child,
    );
  }
}

class _InheritedWidgetRef extends InheritedWidget {
  final WidgetRef ref;

  const _InheritedWidgetRef({required super.child, required this.ref});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
