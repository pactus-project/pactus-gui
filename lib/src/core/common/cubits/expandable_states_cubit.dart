import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandableStateCubit extends Cubit<bool> {
  ExpandableStateCubit() : super(false);

  void toggleExpanded() => emit(!state);
}
