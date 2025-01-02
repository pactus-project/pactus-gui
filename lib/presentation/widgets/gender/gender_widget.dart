import 'package:flutter/material.dart';
import 'package:gui/src/core/enums/gender_enum.dart';


/// ## [GenderSelectionWidget] Class
///
/// ### Overview
/// - A widget that displays the selected gender with an appropriate icon and
/// text. It customizes the display colors based on the selected gender.
///
/// ### Constructor
/// - **[GenderSelectionWidget()]**
///   - `gender`: The selected gender, represented by the [Gender] enum.
///   Required parameter.
///
/// ### [build] Method
/// - Returns a [Center] widget containing a [Column] with:
///   - A [Text] widget displaying the selected gender ("Female" or "Male").
///   - An [Icon] widget showing either a female or male icon based
///   on the gender.
///
/// ### Usage
/// The widget adjusts its appearance based on the selected gender:
/// - Displays "Female" and a female icon with a pink color for `Gender.f`.
/// - Displays "Male" and a male icon with an orange color for `Gender.m`.
///
class GenderSelectionWidget extends StatelessWidget {

  const GenderSelectionWidget({super.key, required this.gender});
  final Gender gender;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selected Gender: ${gender == Gender.f ? "Female" : "Male"}',
            style: TextStyle(fontSize: 18, color: switch (gender) {
              Gender.m => Colors.red,
              Gender.f => Colors.blue,
            },
            ),
          ),
          Icon(
            gender == Gender.f ? Icons.female : Icons.male,
            color: switch (gender) {
              Gender.m => Colors.red,
              Gender.f => Colors.blue,
            },
            size: 48,
          ),
        ],
      ),
    );
  }
}
