import 'package:intl/intl.dart';

import 'is_arabic.dart';

String formatDate(String date) {
  final parsedDate = DateTime.parse(date);
  String locale = isArabic() ? 'ar' : "en";
  return DateFormat('yyyy/MM/dd - hh:mm a', locale).format(parsedDate);
}
