import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floutask_app/screens/home.dart';
import 'package:floutask_app/services/Authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      backgroundColor: Color(0xFFE2C6A9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Image.asset('assets/images/nameicon.png', scale: 10),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Center(
              child: MaterialButton(
                onPressed: () async {
                  User? user = await Authenticator.iniciarSesion(context: context);
                  if(user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home(user: user,)),
                    );
                  }
                },
                color: Colors.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.google, color: Colors.brown),
                    SizedBox(width: 10),
                    Text(
                      'Empieza a crear con FlouTask',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown,
                        fontFamily: GoogleFonts.oxygen().fontFamily,
                      ),
                    ),
                  ],
                ),
                textColor: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}