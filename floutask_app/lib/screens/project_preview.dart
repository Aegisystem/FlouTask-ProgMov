import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProjectPreview extends StatefulWidget {
  final String title;
  final double progress;
  final int members;

  const ProjectPreview({
    required this.title,
    required this.progress,
    required this.members
  });

  @override
  _ProjectPreviewState createState() => _ProjectPreviewState();
}

class _ProjectPreviewState extends State<ProjectPreview> {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(top: 20.0),
      child: ListTile(
        onTap: () {

        },
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.brown,
            fontFamily: GoogleFonts.oxygen().fontFamily,
          ),
        ),
        subtitle: LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          lineHeight: 8.0,
          percent: widget.progress,
          backgroundColor: Colors.grey,
          linearGradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.brown, Colors.greenAccent]
            ),
          barRadius: const Radius.circular(10.0),
          ),
        trailing: Icon(widget.members>1?Icons.groups:Icons.person),
      ),
    )
    );
  }
}