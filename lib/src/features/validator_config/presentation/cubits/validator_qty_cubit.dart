import 'package:flutter_bloc/flutter_bloc.dart';

/// ## [ValidatorQtyCubit] Class Documentation
///
/// A [Cubit] that manages the state of a quantity validator.
///
/// ### Initial State:
/// - Defaults to **"select "**.
///
/// ### Methods:
///
/// - **[setQty]**(String qty):
///   - Updates the state with the given qty.
///
/// ### Usage:
/// - Can be used in a [BlocBuilder] to react to quantity changes in a form.

// class ValidatorQtyCubit extends Cubit<String> {
//   ValidatorQtyCubit() : super('select');
//
//   void setQty(String qty) {
//     emit(qty);
//   }
// }
