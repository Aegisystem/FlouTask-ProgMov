import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floutask_app/screens/objective_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EditProject extends StatefulWidget {
  final String title;
  final double progress;
  final int members;
  final List objectives;
  final String projectID;

  const EditProject({
    required this.title,
    required this.progress,
    required this.members,
    required this.objectives,
    required this.projectID,
  });

  @override
  _EditProjectState createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  double calculateProgress() {
    final List objectives = widget.objectives;
    final int totalObjectives = objectives.length;
    int completedObjectives = 0;

    for (var objective in objectives) {
      if (objective['isChecked'] == true) {
        completedObjectives++;
      }
    }

    if (totalObjectives > 0) {
      return completedObjectives / totalObjectives;
    } else {
      return 0.0;
    }
  }

  List filteredObjectives = [];

  @override
  void initState() {
    super.initState();
    filteredObjectives = widget.objectives;
  }

  void filterObjectives(String searchText) {
    setState(() {
      filteredObjectives = widget.objectives.where((objective) {
        final String title = objective['title'].toLowerCase();
        final String data = objective['data'].toLowerCase();
        return title.contains(searchText.toLowerCase()) ||
            data.contains(searchText.toLowerCase());
      }).toList();
    });
  }

  Widget build(BuildContext context) {
    final double progress = calculateProgress();

    return Scaffold(
      backgroundColor: Color(0xFFE2C6A9),
      body: Column(
        children: [
          SizedBox(height: 40.0),
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
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
                      percent: progress,
                      backgroundColor: Colors.grey,
                      linearGradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.brown, Colors.greenAccent],
                      ),
                      barRadius: const Radius.circular(10.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.brown),
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          filterObjectives(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Busca dentro de tu objetivo 😈',
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
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 15),
              itemCount: filteredObjectives.length,
              itemBuilder: (context, index) {
                var objective = filteredObjectives[index];
                return ObjectiveCard(
                  projectTitle: widget.title,
                  title: objective["title"]!,
                  data: truncateString(objective["data"]!),
                  navigation: true,
                  isCheck: objective["isChecked"] ?? false,
                  index: index,
                  onCheckChanged: (isChecked) {
                    setState(() {
                      objective["isChecked"] = isChecked;
                    });
                    updateObjectiveCheckState(isChecked, index);
                  },
                  projectProgress: progress,
                  projectID: widget.projectID,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String truncateString(String input, {int wordLimit = 6}) {
    final words = input.split(' ');
    if (words.length <= wordLimit) {
      return input;
    }
    final truncatedWords = words.sublist(0, wordLimit);
    return truncatedWords.join(' ') + '...';
  }

  Future<void> updateObjectiveCheckState(bool isChecked, int index) async {
    try {
      final projectRef = FirebaseFirestore.instance
          .collection('projects')
          .doc(widget.projectID);
      final projectDoc = await projectRef.get();

      if (projectDoc.exists) {
        final objectives = List.from(projectDoc.data()!['objectives']);
        objectives[index]['isChecked'] = isChecked;

        await projectRef.update({'objectives': objectives});

        final int completedObjectives = objectives
            .where((objective) => objective['isChecked'] == true)
            .length;
        final double newProgress = completedObjectives / objectives.length;

        await projectRef.update({'progress': newProgress});

        setState(() {
          // Actualizar el estado de los objetivos en el widget padre
          filteredObjectives = objectives;
        });
      }
    } catch (e) {
      print('Error updating objective check statee: $e');
    }
  }
}
