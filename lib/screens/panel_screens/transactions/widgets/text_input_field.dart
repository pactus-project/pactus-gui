import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget formInput(String hint, FocusNode fN, TextEditingController tec,
    bool isAmnt, bool isDark, bool isMemo) {
  if (isAmnt) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*Field is required';
        }
        return null;
      },
      focusNode: fN,
      controller: tec,
      maxLength: isMemo ? 64 : null,
      keyboardType: (!isAmnt)
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true, signed: false),
      cursorColor: Colors.grey.shade700,
      style: GoogleFonts.lexend(
        color: isDark ? Colors.grey.shade200 : Colors.grey.shade800,
        fontSize: 12.spMin,
      ),
      decoration: InputDecoration(
        fillColor:
            isDark ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
        suffix: Text(
          "PAC",
          maxLines: 1,
          textAlign: TextAlign.justify,
          style: GoogleFonts.lexend(
            color: isDark ? Colors.grey.shade200 : Colors.grey.shade800,
            fontSize: 12.spMin,
          ),
        ),

        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorStyle:
            GoogleFonts.lexend(fontWeight: FontWeight.w400, fontSize: 12.spMin),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.spMin,
        ),
        labelText: hint,
        // error: Text("*Field is required",style: GoogleFonts.lexend(color: Colors.grey.shade800, fontSize: 12.sp),
        // ),
        labelStyle: GoogleFonts.lexend(
          color: isDark ? Colors.grey.shade200 : Colors.grey.shade700,
          fontSize: 12.spMin,
        ),
        hintStyle: GoogleFonts.lexend(
          color: isDark ? Colors.grey.shade600 : Colors.grey.shade600,
          fontSize: 12.spMin,
        ),
      ),
      onSaved: (value) {},
      onTapOutside: (event) => fN.unfocus(),
      onEditingComplete: () => fN.unfocus(),
    );
  } else {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*Field is required';
        }
        return null;
      },
      focusNode: fN,
      controller: tec,
      maxLength: isMemo ? 64 : null,
      keyboardType: !isAmnt ? TextInputType.text : TextInputType.number,
      cursorColor: Colors.grey.shade700,
      style: GoogleFonts.lexend(
        color: isDark ? Colors.grey.shade200 : Colors.grey.shade800,
        fontSize: 12.spMin,
      ),
      decoration: InputDecoration(
        fillColor:
            isDark ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,

        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorStyle:
            GoogleFonts.lexend(fontWeight: FontWeight.w400, fontSize: 12.spMin),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.spMin,
        ),
        labelText: hint,
        // error: Text("*Field is required",style: GoogleFonts.lexend(color: Colors.grey.shade800, fontSize: 12.sp),
        // ),
        labelStyle: GoogleFonts.lexend(
          color: isDark ? Colors.grey.shade200 : Colors.grey.shade800,
          fontSize: 12.spMin,
        ),
      ),
      onSaved: (value) {},
      onTapOutside: (event) => fN.unfocus(),
      onEditingComplete: () => fN.unfocus(),
    );
  }
}
