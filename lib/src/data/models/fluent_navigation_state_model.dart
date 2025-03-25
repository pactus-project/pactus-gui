import 'package:freezed_annotation/freezed_annotation.dart';

part 'fluent_navigation_state_model.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required int selectedIndex,
    required bool isMenuOpen,
  }) = _NavigationState;

  factory NavigationState.initial() => const NavigationState(
        selectedIndex: 0,
        isMenuOpen: false,
      );
}
