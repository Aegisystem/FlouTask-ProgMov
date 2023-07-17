import 'package:firebase_core/firebase_core.dart';
import 'package:floutask_app/screens/objective_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EditProject extends StatefulWidget {
  final String title;
  final double progress;
  final int members;
  final List objectives;

  const EditProject({
    required this.title,
    required this.progress,
    required this.members,
    required this.objectives
  });

  @override
  _EditProjectState createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  // Variable que almacena el array con los datos de cada objetivo
  var object = [
    {"title": "Objetivo 1", "subtitle": "Subtitulo 1"},
    {"title": "Objetivo 2", "subtitle": "Subtitulo 2"},
    {"title": "Objetivo 3", "subtitle": "Subtitulo 3"},
    {"title": "Objetivo 4", "subtitle": "Subtitulo 4"},
    {"title": "Objetivo 5", "subtitle": "Subtitulo 5"},
    {"title": "Objetivo 6", "subtitle": "Subtitulo 6"},
    {"title": "Objetivo 7", "subtitle": "Subtitulo 7"},
    // Agrega más objetivos aquí
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2C6A9),
      body: Column(
        children: [
          SizedBox(height: 40.0),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown,
                      fontFamily: GoogleFonts.oxygen().fontFamily,
                    ),
                  ),
                  LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.brown),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Busca dentro de tu proyecto :)',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Icons.search, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 15),
              itemCount: widget.objectives.length,
              itemBuilder: (context, index) {
                var objective = widget.objectives[index];
                return ObjectiveCard(
                  title: objective["title"]!,
                  subtitle: objective["data"]!,
                  progress: widget.progress!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
