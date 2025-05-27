import 'package:intl/intl.dart';

extension StringDateFormatting on String {
  String formatDate({
    String fromPattern = 'yyyy-MM-dd HH:mm:ss',
    required String toPattern,
  }) {
    final dt = DateFormat(fromPattern).parse(this);
    return DateFormat(toPattern).format(dt);
  }
}
