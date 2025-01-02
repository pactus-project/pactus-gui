import 'package:flutter/material.dart';
import 'package:gui/src/core/enums/gender_enum.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'gender_widget.dart';

/// ## [genderSelectionWidgetUseCase] Function
///
/// ### Overview
/// - A use case function that demonstrates the [GenderSelectionWidget] by -
/// allowing the user to select a gender via a knob control.
///
/// ### Parameters
/// - `context`: The [BuildContext] to access the widget tree and knobs.
///
/// ### Functionality
/// - A knob is created to allow the user to select between "Male" -
/// (represented by `'m'`) and "Female" (represented by `'f'`).
/// - The selected string value is mapped to the corresponding [Gender] enum -
/// value (`Gender.f` or `Gender.m`).
/// - The [GenderSelectionWidget] is then returned with the selected gender.
///
@UseCase(name: 'Gender Selection with Knob', type: GenderSelectionWidget)
Widget genderSelectionWidgetUseCase(BuildContext context) {
  // Create a knob to select gender
  final selectedGender = context.knobs.string(
    label: 'Select Gender',
    initialValue: 'f', // Default value
    description: 'Choose between Male (m) and Female (f)',
  );

  // Map the selected string value to the Gender enum
  final gender = selectedGender == 'f' ? Gender.f : Gender.m;

  return GenderSelectionWidget(gender: gender);
}
