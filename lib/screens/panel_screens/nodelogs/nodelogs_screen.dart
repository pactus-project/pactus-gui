import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NodeLogsScreen extends ConsumerStatefulWidget {
  const NodeLogsScreen({super.key});

  @override
  ConsumerState<NodeLogsScreen> createState() => _NodeLogsScreenState();
}

class _NodeLogsScreenState extends ConsumerState<NodeLogsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkModelEnabled = fi.FluentTheme.of(context).brightness.isDark;
    return Scaffold(
      backgroundColor: isDarkModelEnabled ? const Color(0xFF0F1012) : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Node Logs',
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
