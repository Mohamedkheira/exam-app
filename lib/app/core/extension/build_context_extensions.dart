import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext{

   TextTheme get textTheme => Theme.of(this).textTheme;
}