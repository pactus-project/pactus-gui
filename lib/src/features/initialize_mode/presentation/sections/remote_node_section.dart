import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/features/initialize_mode/presentation/widgets/auth_method_component.dart';
import 'package:pactus_gui/src/features/initialize_mode/presentation/widgets/password_component.dart';
import 'package:pactus_gui/src/features/initialize_mode/presentation/widgets/remote_address_component.dart';
import 'package:pactus_gui/src/features/initialize_mode/presentation/widgets/username_component.dart';

/// ## [RemoteNodeSection] Class Documentation
///
/// The `RemoteNodeSection` provides a UI section for
/// configuring remote node settings.
///
/// ### UI Components:
///
/// - **Remote Address Input:**
///   - Uses `RemoteAddressComponent` to capture the remote node address.
///
/// - **Authentication Method Selection:**
///   - Displays authentication method options via `AuthMethodComponent`.
///
/// - **Username Input:**
///   - Uses `UserNameComponent` for entering the username.
///
/// - **Password Input:**
///   - Uses `PasswordComponent` for entering the password securely.
///
/// ### Important Notes:
///
/// - Uses `Fluent UI` components for styling consistency.
/// - `AuthMethodComponent` manages different authentication methods.
/// - The section is structured as a column with proper spacing.
///
class RemoteNodeSection extends StatefulWidget {
  const RemoteNodeSection({super.key});
  @override
  RemoteNodeSectionState createState() => RemoteNodeSectionState();
}

class RemoteNodeSectionState extends State<RemoteNodeSection> {
  final _passwordKey = GlobalKey<PasswordComponentState>();
  final _usernameKey = GlobalKey<UserNameComponentState>();
  final _remoteAddressKey = GlobalKey<RemoteAddressComponentState>();

  bool validate() {
    final isPasswordValid = _passwordKey.currentState?.validate() ?? false;
    final isUsernameValid = _usernameKey.currentState?.validate() ?? false;
    final isRemoteAddressValid =
        _remoteAddressKey.currentState?.validate() ?? false;
    return isPasswordValid && isUsernameValid && isRemoteAddressValid;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 28,
      children: [
        RemoteAddressComponent(key: _remoteAddressKey),
        AuthMethodComponent(),
        UserNameComponent(key: _usernameKey),
        PasswordComponent(key: _passwordKey),
      ],
    );
  }
}
