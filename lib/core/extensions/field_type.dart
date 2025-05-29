import 'dart:developer';

import '../../modules/task_form/enums/field_type.dart';

extension FieldTypeExtension on String {
  FieldType toFieldType() {
    log(this);
    return FieldType.values.firstWhere(
      (type) => type.name == this,
      orElse: () => FieldType.text,
    );
  }
}
