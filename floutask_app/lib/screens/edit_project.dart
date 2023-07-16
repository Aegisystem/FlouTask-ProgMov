import 'package:floutask_app/screens/objective_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EditProject extends StatefulWidget {
  @override
  _EditProjectState createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  bool _isButtonPressed = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2C6A9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child:

                Column(
                  children:[
                    Text(
                      'Estructuras de Datos',
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
                          ..scale(_isButtonPressed ? 1.2 : 1.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.add_sharp),
                            color: Colors.brown,
                            onPressed: () {
                              Navigator.pushNamed(context, '/addproject.dart');
                            },
                          ),
                        ),
                      ),
                    ),
                    const ObjectiveCard(
                      title: 'Conectar BD',
                      subtitle: 'Para conectar la base de datos debes seguir estos pasos...',
                    ),
                    const ObjectiveCard(
                      title: 'Otra tarjeta',
                      subtitle: 'Descripción de la otra tarjeta...',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}