extension BoolToDb on bool {
  int toDb() {
    return this ? 1 : 0;
  }
}

extension IntToBool on int {
  bool toBool() {
    return this == 1;
  }
}
