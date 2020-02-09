import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
        show debugDefaultTargetPlatformOverride;

import 'counter_bloc.dart';
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new CounterBlocApp());
}