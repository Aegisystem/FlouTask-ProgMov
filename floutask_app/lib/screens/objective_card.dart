import 'package:floutask_app/screens/in_objective.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ObjectiveCard extends StatefulWidget {
  final String projectTitle;
  final String title;
  final String data;
  final bool navigation;
  final bool isCheck;

  const ObjectiveCard({
    required this.title,
    required this.data,
    required this.navigation,
    required this.isCheck,
    required this.projectTitle,
  });

  @override
  _ObjectiveCardState createState() => _ObjectiveCardState();
}

class _ObjectiveCardState extends State<ObjectiveCard> {
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
            widget.navigation ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  EditObjective(
                    data: widget.data,
                    isCheck: widget.isCheck,
                    title: widget.title,
                    projectTitle: widget.projectTitle,
                  )
              ),
            ) : "";
          },
          leading: Checkbox(
            value: widget.isCheck,
            onChanged: (value) {
              setState(() {
                //TODO Cambiar estado en BD
                _check = value!;
              });
            },
            activeColor: Colors.green,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.brown,
              fontFamily: GoogleFonts.oxygen().fontFamily,
            ),
          ),
          subtitle: Text(
            widget.data,
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontFamily: GoogleFonts.oxygen().fontFamily,
            ),
          ),
        ),
      )
    );
  }
}