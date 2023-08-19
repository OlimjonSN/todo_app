import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: IconButton(onPressed: () {}, icon: const Icon(Icons.circle_outlined)),
                title: Text(
                  'Bozorga borish',
                  style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.black,
                  ),
                ),
              );
            })));
  }
}
