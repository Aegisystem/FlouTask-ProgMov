import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'objective_card.dart';

class EditObjective extends StatefulWidget {
  final String projectTitle;
  final String title;
  final String data;
  final bool isCheck;

  const EditObjective({
    required this.title,
    required this.data,
    required this.isCheck,
    required this.projectTitle,
  });

  @override
  _EditObjectiveState createState() => _EditObjectiveState();
}

class _EditObjectiveState extends State<EditObjective> {
  TextEditingController _textEditingController = TextEditingController();
  TextAlign _textAlign = TextAlign.left;
  FontWeight _fontWeight = FontWeight.normal;
  FontStyle _fontStyle = FontStyle.normal;
  TextDecoration _textDecoration = TextDecoration.none;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _applyFontWeight() {
    setState(() {
      _fontWeight = _fontWeight == FontWeight.bold ? FontWeight.normal : FontWeight.bold;
    });
  }

  void _applyFontStyle() {
    setState(() {
      _fontStyle = _fontStyle == FontStyle.italic ? FontStyle.normal : FontStyle.italic;
    });
  }

  void _applyTextDecoration() {
    setState(() {
      _textDecoration = _textDecoration == TextDecoration.lineThrough ? TextDecoration.none : TextDecoration.lineThrough;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2C6A9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.0),
            Center(
              child: Text(
                widget.projectTitle,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              padding: EdgeInsets.only(top: 9.0, bottom: 15.0),
              width: 250.0,
              lineHeight: 30.0,
              percent: 0.3,
              backgroundColor: Colors.grey,
              linearGradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.green, Colors.greenAccent],
              ),
              barRadius: const Radius.circular(10.0),
            ),
            SizedBox(height: 16.0),
            /*ObjectiveCard(
              title: widget.title,
              data: 'Editando',
              navigation: false,
              isCheck: widget.isCheck,
              projectTitle: widget.projectTitle,
            ),*/
            SizedBox(height: 16.0),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: _textEditingController,
                      style: TextStyle(
                        fontWeight: _fontWeight,
                        fontStyle: _fontStyle,
                        decoration: _textDecoration,
                        color: Colors.black,
                      ),
                      textAlign: _textAlign,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.format_bold),
              onPressed: _applyFontWeight,
              color: _fontWeight == FontWeight.bold ? Colors.blue : Colors.grey,
            ),
            IconButton(
              icon: Icon(Icons.format_italic),
              onPressed: _applyFontStyle,
              color: _fontStyle == FontStyle.italic ? Colors.blue : Colors.grey,
            ),
            IconButton(
              icon: Icon(Icons.format_strikethrough),
              onPressed: _applyTextDecoration,
              color: _textDecoration == TextDecoration.lineThrough ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}