import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/material.dart';

class UserWalletScreen extends StatefulWidget {
  const UserWalletScreen({super.key});

  @override
  State<UserWalletScreen> createState() => _UserWalletScreenState();
}

class _UserWalletScreenState extends State<UserWalletScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkModelEnabled = fi.FluentTheme.of(context).brightness.isDark;
    return Scaffold(
      backgroundColor:
          isDarkModelEnabled ? const Color(0xFF0F1012) : Colors.white,
    );
  }
}
