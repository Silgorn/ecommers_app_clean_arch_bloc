import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:flutter/material.dart';

SnackBar showSnackBar(String message) {
  return SnackBar(
    content: Text(message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: TColors.textLight)),
    backgroundColor: TColors.accent,
    duration: Durations.medium4,
  );
}
