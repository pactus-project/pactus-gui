import 'package:fluent_ui/fluent_ui.dart';

class StandardPageLayout extends StatelessWidget {
  const StandardPageLayout({
    super.key,
    required this.content,
    required this.footer,
  });
  final Widget content;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: content,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: footer,
          ),
        ],
      ),
    );
  }
}
