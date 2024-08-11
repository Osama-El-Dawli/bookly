import 'package:flutter/material.dart';

ScaffoldMessenger showSnackBar(String text) {
  return ScaffoldMessenger(
    child: SnackBar(
      content: Text(text),
    ),
  );
}