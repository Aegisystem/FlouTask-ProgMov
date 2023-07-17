import 'package:floutask_app/screens/in_objective.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ObjectiveCard extends StatefulWidget {
  final String projectTitle;
  final String title;
  final String data;
  final bool navigation;
  final bool isCheck;
  final int index;
  final Function(bool) onCheckChanged;
  final projectProgress;
  final projectID;

  const ObjectiveCard({
    required this.title,
    required this.data,
    required this.navigation,
    required this.isCheck,
    required this.projectTitle,
    required this.index,
    required this.onCheckChanged,
    required this.projectProgress,
    required this.projectID,
  });

  @override
  _ObjectiveCardState createState() => _ObjectiveCardState();
}

class _ObjectiveCardState extends State<ObjectiveCard> {
  bool _isCheck = false;
  late String data = ' ';

  @override
  void initState() {
    super.initState();
    _isCheck = widget.isCheck;
    data = widget.data;
  }

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
            if (widget.navigation) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditObjective(
                    title: widget.title,
                    projectTitle: widget.projectTitle,
                    projectProgress: widget.projectProgress,
                    projectID: widget.projectID,
                    index: widget.index,
                  ),
                ),
              );
            }
          },
          leading: Checkbox(
            value: _isCheck,
            onChanged: (value) async {
              final updatedIsCheck = value ?? false;
              setState(() {
                _isCheck = updatedIsCheck;
              });

              widget.onCheckChanged(updatedIsCheck);
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
            data,
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontFamily: GoogleFonts.oxygen().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
