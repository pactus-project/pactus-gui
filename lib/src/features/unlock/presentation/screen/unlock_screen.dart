import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Icon
              Container(
                width: 406,
                height: 364,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).extension<DarkPallet>()!.dark100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Builder(
                    builder: (context) {
                      final isDark = FluentTheme.of(context).brightness !=
                          Brightness.light;
                      return SvgPicture.asset(
                        isDark
                            ? Assets.images.masterPasswordDark
                            : Assets.images.masterPasswordLight,
                        width: 406,
                        height: 364,
                      );
                    },
                  ),
                ),
              ),

              Assets.icons.lock.image(
                width: 30,
                height: 30,
                fit: BoxFit.contain,
                color: AppTheme.of(context).extension<LightPallet>()!.light900,
              ),
              const SizedBox(height: 32),

              // Password Text
              Text(
                'Enter the master password to unlock',
                style: FluentTheme.of(context).typography.body,
              ),
              const SizedBox(height: 16),

              // Password Input
              SizedBox(
                width: 300,
                child: TextBox(
                  controller: _passwordController,
                  placeholder: '••••••••',
                  obscureText: _obscureText,
                  suffix: IconButton(
                    icon: Icon(
                      _obscureText ? FluentIcons.hide : FluentIcons.red_eye,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Unlock Button
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: ButtonState.all(Colors.blue),
                  padding: ButtonState.all(
                    const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 8,
                    ),
                  ),
                ),
                onPressed: _handleUnlock,
                child: const Text(
                  'Unlock',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleUnlock() async {
    final password = _passwordController.text;

    // // Get from secure storage
    // final encryptedVault = NodeConfigData.instance.encryptedVault;
    // final salt = NodeConfigData.instance.salt;

    // // Key derivation
    // final key = await Argon2.hashPasswordString(
    //   password,
    //   salt: salt,
    //   iterations: 4,
    //   memory: 4096,
    // );

    // // Attempt decryption
    // try {
    //   final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    //   final decrypted = encrypter.decrypt64(encryptedVault);

    //   // If successful, load wallet data from decrypted vault
    //   _navigateToDashboard(decrypted);
    // } catch (e) {
    //   // Show invalid password error
    // }
  }

  void _navigateToDashboard(String decrypted) {
    // Implementation of _navigateToDashboard method
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
