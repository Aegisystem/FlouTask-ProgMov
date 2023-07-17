import 'package:firebase_auth/firebase_auth.dart';
import 'package:floutask_app/screens/edit_project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProjectPreview extends StatefulWidget {
  final String title;
  final double progress;
  final int members;
  final List objectives;
  final String projectID;
  final User user;

  const ProjectPreview({
    required this.title,
    required this.progress,
    required this.members,
    required this.objectives,
    required this.projectID,
    required this.user,
  });

  @override
  _ProjectPreviewState createState() => _ProjectPreviewState();
}

class _ProjectPreviewState extends State<ProjectPreview> {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProject(
                          members: widget.members,
                          objectives: widget.objectives,
                          title: widget.title,
                          progress: widget.progress,
                          projectID: widget.projectID,
                        )),
              );
            },
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.oxygen().fontFamily,
              ),
            ),
            subtitle: LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              lineHeight: 7.0,
              percent: widget.progress,
              backgroundColor: Colors.grey,
              linearGradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.brown, Colors.greenAccent]),
              barRadius: const Radius.circular(10.0),
            ),
            trailing: widget.members == 1
                ? CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.photoURL!),
                  )
                : Icon(Icons.groups, color: Colors.brown),
          ),
        ));
  }
}
