import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:aladia_demo_app/auth/presentation/widget/circular_indicator.dart';

@widgetbook.UseCase(name: 'Default', type: CircularIndicator)
Widget buildCustomInputFieldUseCase(BuildContext context) {
  return const CircularIndicator();
}
