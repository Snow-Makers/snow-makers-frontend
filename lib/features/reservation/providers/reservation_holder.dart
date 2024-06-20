import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snowmakers/core/utilities/snackbar.dart';

class ReservationHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => ReservationHolder());

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final List<String> _dates = [];
  final List<String> _selectedDates = [];

  List<String> get selectedDates => _selectedDates;

  set selectedDates(List<String> value) {
    _selectedDates.clear();
    _selectedDates.addAll(value);
    notifyListeners();
  }

  void addDateRange(String startDate, String endDate, BuildContext context) {
    DateTime newStartDate = DateTime.parse(startDate);
    DateTime newEndDate = DateTime.parse(endDate);

    bool isSelectedOverlapping = _selectedDates.any((range) {
      List<String> dates = range.split(' - ');
      DateTime existingStartDate = DateTime.parse(dates[0]);
      DateTime existingEndDate = DateTime.parse(dates[1]);

      return newStartDate.isBefore(existingEndDate) &&
          newEndDate.isAfter(existingStartDate);
    });

    bool isOverlapping = _dates.any((range) {
      List<String> dates = range.split(' - ');
      DateTime existingStartDate = DateTime.parse(dates[0]);
      DateTime existingEndDate = DateTime.parse(dates[1]);

      return newStartDate.isBefore(existingEndDate.add(const Duration(days: 1))) &&
          newEndDate.add(const Duration(days: 1)).isAfter(existingStartDate);
    });

    if (isSelectedOverlapping) {
      CustomSnackBar.showError(context, "This date is already selected");
    } else if (isOverlapping) {
      CustomSnackBar.showError(context, "You cannot select overlapping dates");
    } else {
      _dates.add('$startDate - $endDate');
      _dates.sort();
    }
    notifyListeners();
  }

  void removeDate(String dateRange) {
    dates = dates.where((date) => date != dateRange).toList();
    dates.sort();
    notifyListeners();
  }

  List<String> get dates => _dates;

  set dates(List<String> value) {
    _dates.clear();
    _dates.addAll(value);
    _dates.sort();
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

  void clear() {
    name.clear();
    email.clear();
    phone.clear();
    dates.clear();
    selectedDates.clear();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
    dates.clear();
    selectedDates.clear();
  }
}
