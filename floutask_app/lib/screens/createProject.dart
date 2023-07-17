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
  final List<String> objetivos = [];
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
        objetivos.add(nuevoObjetivo);
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
                            objetivo: objetivos[i],
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

class Home extends StatefulWidget {
  final User user;

  Home({required this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isButtonPressed = false;
  final CollectionReference _projectsCollection =
  FirebaseFirestore.instance.collection('projects');

  void _cerrarSesion() async {
    // Cerrar sesión con FirebaseAuth
    await FirebaseAuth.instance.signOut();
    // Navegar a la pantalla de inicio de sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
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
              child: Image.asset(
                'assets/images/nameicon.png',
                scale: 15,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: TextField(
              style: TextStyle(color: Colors.brown),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Busca en tus proyectos :)',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTapDown: (_) {
              setState(() {
                _isButtonPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _isButtonPressed = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _isButtonPressed = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()..scale(_isButtonPressed ? 1.95 : 1.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.add_sharp),
                  color: Colors.brown,
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 200));

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateProject()),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Expanded(
            flex: 10,
            child: StreamBuilder<QuerySnapshot>(
              stream: _projectsCollection
                  .where('userId', isEqualTo: widget.user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  final projects = snapshot.data!.docs;

                  return ListView.builder(
                    padding: EdgeInsets.only(top: 5),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      var projectData = projects[index].data() as Map<String, dynamic>;
                      return ProjectPreview(
                        title: projectData['projectName'].toString(),
                        progress: projectData['progress'].toDouble(),
                        members: projectData['memberCount'],
                      );
                    },
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 5.0,
            left: 30.0,
            child: InkWell(
              onTap: _cerrarSesion,
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.network(
                    widget.user.photoURL!,
                    fit: BoxFit.cover,
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



