import 'package:intl/intl.dart';

bool isArabic() {
  var lang = Intl.getCurrentLocale();
  return lang == 'ar';
}
