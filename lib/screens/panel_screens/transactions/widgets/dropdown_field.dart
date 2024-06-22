import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionDropDownField extends StatefulWidget {
  dynamic value;
  List<Map<String, String>> items;
  FocusNode fn;
  bool isDark;
  String hint;
  TransactionDropDownField({
    super.key,
    required this.value,
    required this.items,
    required this.fn,
    required this.isDark,
    required this.hint,
  });

  @override
  State<TransactionDropDownField> createState() =>
      _TransactionDropDownFieldState();
}

class _TransactionDropDownFieldState extends State<TransactionDropDownField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.isDark
              ? Colors.white.withOpacity(0.08)
              : Colors.grey.shade200,
        ),
        child: DropdownButton(
          focusNode: widget.fn,
          value: widget.value == ''? null : widget.value,
          padding: EdgeInsets.symmetric(horizontal: 8.spMin),
          elevation: 0,
          style: GoogleFonts.lexend(
              fontSize: 12.spMin,
              color:
                  widget.isDark ? Colors.grey.shade200 : Colors.grey.shade800),
          underline: const Text(''),
          hint: Text(
            widget.hint,
            style: GoogleFonts.lexend(
                fontSize: 12.spMin,
                color: widget.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade800),
          ),
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onChanged: (val) => {
            setState(() {
              widget.value = val;
            })
          },
          isExpanded: true,
          dropdownColor: widget.isDark
              ? Colors.black.withOpacity(0.99)
              : Colors.grey.shade300,
          items: widget.items
              .map(
                (e) => DropdownMenuItem(
                  value: e['value'].toString(),
                  child: Text(
                    e['name'].toString(),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
