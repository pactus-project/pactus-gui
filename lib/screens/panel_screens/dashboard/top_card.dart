import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCard extends ConsumerStatefulWidget {
  bool isDark;
  IconData iconData;
  var title, subtitle;
  TopCard(
      {super.key,
      required this.isDark,
      required this.title,
      required this.subtitle,
      required this.iconData});

  @override
  ConsumerState<TopCard> createState() => _TopCardState();
}

class _TopCardState extends ConsumerState<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110.sp,
      constraints: BoxConstraints(minWidth: 120.sp),
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: widget.isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.grey.shade200,
        // boxShadow: [BoxShadow(color: Colors.transparent)],

        border: Border(
          left: BorderSide(
            width: 4.sp,
            color: Color(0xFF6CEBA6).withOpacity(0.5),
          ),
        ),
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title.toString(),
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600, fontSize: 12.spMin),
              ),
              Text(
                widget.subtitle.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 12.spMin),
              )
            ],
          ),
          SizedBox(width: 10.sp),
          Icon(
            widget.iconData,
            size: 30.sp,
          ),
        ],
      ),
    );
  }
}
