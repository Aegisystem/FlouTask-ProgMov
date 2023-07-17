import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:floutask_app/screens/project_preview.dart';
import 'login.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final List objetivos = [];
  final TextEditingController objetivoController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int selectedMemberCount = 1;
  List<int> memberCounts = [1, 2, 3, 4, 5];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _projectsCollection =
  FirebaseFirestore.instance.collection('projects');

  @override
  void dispose() {
    objetivoController.dispose();
    projectNameController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void agregarObjetivo() {
    final nuevoObjetivo = objetivoController.text;
    if (nuevoObjetivo.isNotEmpty) {
      setState(() {
        objetivos.add({"title": nuevoObjetivo, "isChecked": false, "data": ""});
        objetivoController.clear();
      });
    }
  }

  void eliminarObjetivo(int index) {
    setState(() {
      objetivos.removeAt(index);
    });
  }

  Future<void> guardarProyecto() async {
    Navigator.pop(context);

    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String projectName = projectNameController.text;
      final int progress = 0;
      final int memberCount = selectedMemberCount;

      final DocumentReference projectRef = await _projectsCollection.add({
        'userId': user.uid,
        'projectName': projectName,
        'progress': progress,
        'memberCount': memberCount,
        'objectives': objetivos,
        'isChecked': false,
      });

      final String projectId = projectRef.id;

      projectNameController.clear();
      objetivoController.clear();
      objetivos.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2C6A9),
      appBar: AppBar(
        title: const Text('AÑADIR PROYECTO'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            color: Colors.brown,
            height: 5.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/nameicon.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: projectNameController,
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'NOMBRE DEL PROYECTO',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Listar objetivos del proyecto",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: objetivoController,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'OBJETIVOS',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            maxLines: null,
                          ),
                        ),
                        IconButton(
                          onPressed: agregarObjetivo,
                          icon: Icon(Icons.add),
                          color: Colors.brown,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < objetivos.length; i++)
                          ObjetivoWidget(
                            objetivo: objetivos[i]['title'],
                            onDelete: () => eliminarObjetivo(i),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OPCIONES DE COMPARTIR',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.groups, color: Colors.brown),
                        const SizedBox(width: 10),
                        DropdownButton<int>(
                          value: selectedMemberCount,
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedMemberCount = newValue!;
                            });
                          },
                          items: memberCounts.map<DropdownMenuItem<int>>(
                                (int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: guardarProyecto,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0),
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 2,
                        left: 2,
                        child: Text(
                          'CREAR PROYECTO',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'CREAR PROYECTO',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ObjetivoWidget extends StatelessWidget {
  final String objetivo;
  final VoidCallback onDelete;

  const ObjetivoWidget({
    Key? key,
    required this.objetivo,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(objetivo, style: TextStyle(color: Colors.brown)),
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: onDelete,
          color: Colors.brown,
        ),
      ],
    );
  }
}