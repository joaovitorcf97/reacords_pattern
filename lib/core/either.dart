import 'package:flutter/material.dart';

class Either {
  static void map<L, R>(
    (L, R) record,
    ValueChanged<L> left,
    ValueChanged<R> right,
  ) {
    if (record.$1 != null) {
      left(record.$1);
    } else if (record.$2 != null) {
      right(record.$2);
    }
  }
}
