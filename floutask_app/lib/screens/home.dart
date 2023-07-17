import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:floutask_app/screens/project_preview.dart';
import 'package:floutask_app/screens/createProject.dart';
import 'package:floutask_app/services/Authenticator.dart';
import 'login.dart';

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
  late Stream<QuerySnapshot> _projectsStream;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _projectsStream = _projectsCollection
        .where('userId', isEqualTo: widget.user.uid)
        .snapshots();
  }

  void _cerrarSesion() async {
    // Cerrar sesión con FirebaseAuth
    await Authenticator.cerrarSesion();
    // Navegar a la pantalla de inicio de sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void _filterProjects(String searchText) {
    setState(() {
      _projectsStream = _projectsCollection
          .where('userId', isEqualTo: widget.user.uid)
          .where('projectName', isGreaterThanOrEqualTo: searchText)
          .where('projectName', isLessThanOrEqualTo: searchText + '\uf8ff')
          .snapshots();
    });
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
              controller: _searchController,
              style: TextStyle(color: Colors.brown),
              cursorColor: Colors.black,
              onChanged: (value) {
                _filterProjects(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Busca en tus proyectos 😊',
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
              transform: Matrix4.identity()
                ..scale(_isButtonPressed ? 1.95 : 1.0),
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
              stream: _projectsStream,
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
                      var projectData =
                      projects[index].data() as Map<String, dynamic>;
                      return ProjectPreview(
                        title: projectData['projectName'].toString(),
                        progress: projectData['progress'].toDouble(),
                        members: projectData['memberCount'],
                        objectives: projectData['objectives'],
                        projectID: projects[index].id,
                        user: widget.user,
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
