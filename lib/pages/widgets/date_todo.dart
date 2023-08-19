import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateTodo extends StatelessWidget {
  final Function selectDate;
  final Function decreaseDate;
  final Function increaseDate;
  final DateTime date;
  const DateTodo({
    required this.increaseDate,
    required this.decreaseDate,
    required this.date,
    required this.selectDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            decreaseDate();
          },
          icon: const Icon(Icons.arrow_left),
          iconSize: 50,
        ),
        TextButton(
            onPressed: () {
              selectDate(context);
            },
            child: RichText(
                text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 25, fontFamily: GoogleFonts.poppins().fontFamily), children: [
              TextSpan(text: '${DateFormat.EEEE().format(date)},', style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                text: ' ${DateFormat('d MMM').format(date)}',
              ),
            ]))),
        IconButton(
          onPressed: () {
            increaseDate();
          },
          icon: const Icon(Icons.arrow_right),
          iconSize: 50,
        )
      ],
    );
  }
}
