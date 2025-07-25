import 'package:fluent_ui/fluent_ui.dart';

class DialogContentWidget extends StatelessWidget {
  const DialogContentWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: constraint.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title)],
            ),
          ),
        );
      },
    );
  }
}
