import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoCount extends StatelessWidget {
  final int count;
  final String title;
  final bool isStartPosition;
  const TodoCount({
    this.isStartPosition = true,
    required this.count,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isStartPosition ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          count < 10 ? '0$count' : 'count',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: GoogleFonts.poppins().fontFamily),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: GoogleFonts.poppins().fontFamily),
        )
      ],
    );
  }
}
