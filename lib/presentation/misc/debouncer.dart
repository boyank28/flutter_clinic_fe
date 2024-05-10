// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration duration;
  Debouncer({
    required this.duration,
  });

  Timer? _timer;

  void run(VoidCallback action) {
    bool isActive = _timer?.isActive ?? false;

    if (isActive) {
      _timer?.cancel();
    }

    _timer = Timer(duration, action);
  }
}
