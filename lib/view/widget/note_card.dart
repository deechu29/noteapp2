import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    this.ondelete,
    required this.title,
    required this.description,
    required this.date, this.onEditing, required Null Function() textediting,
  });
  final void Function()? ondelete;
  final void Function()? onEditing;
  final String title;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(onPressed: onEditing, icon: Icon(Icons.edit)),
                SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: ondelete, icon: Icon(Icons.delete))
              ],
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Share.share('check out my website https://example.com');
                  },
                  icon: Icon(Icons.share),
                  style: ButtonStyle(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
