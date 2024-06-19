import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReservationHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => ReservationHolder());

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final List<String> _dates = [];

  void addDateRange(String startDate, String endDate) {
    _dates.clear();
    dates.addAll([startDate, endDate]);
    notifyListeners();
  }

  void removeDate(String dateRange) {
    dates = dates.where((date) => date != dateRange).toList();
    notifyListeners();
  }

  List<String> get dates => _dates;

  set dates(List<String> value) {
    _dates.clear();
    _dates.addAll(value);
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

  void clear() {
    name.clear();
    email.clear();
    phone.clear();
    dates.clear();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
    dates.clear();
  }
}
