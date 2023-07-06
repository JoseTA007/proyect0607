import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/screens/login_page.dart';

import '../imagenes_splashscren/lista_spalashscren.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // TODO lista de colores, "IMPORTACIONES LYN"
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  // INDEX ASIGNADO AL COLOR INICIAL
  int colorIndex = 0;

  int currentIndex = 0;

  Timer? timer, timer2;

  @override
  void dispose() {
    timer?.cancel();
    timer2?.cancel();
    super.dispose();
  }

  // TODO duracion del splash screen - pantalla inicial dura 5 segundos
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Iniciar(),
        ),
      );
    });
    timer2 = Timer.periodic(const Duration(milliseconds: 500), (Timer timer2) {
      setState(() {
        currentIndex = (currentIndex + 1) % imagesSplashScren.length;
      });
    });

    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        colorIndex = (colorIndex + 1) % colorList.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO fondo de pantalla
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IMPORTACIONES LyM',
              style: TextStyle(color: colorList[colorIndex], fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "P",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.red, fontSize: 60),
                ),
                Text(
                  "R",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.white, fontSize: 40),
                ),
                Text(
                  "O",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.blue, fontSize: 60),
                ),
                Text(
                  "D",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.red, fontSize: 40),
                ),
                Text(
                  "U",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.white, fontSize: 60),
                ),
                Text(
                  "C",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.blue, fontSize: 40),
                ),
                Text(
                  "T",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.red, fontSize: 60),
                ),
                Text(
                  "O",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.white, fontSize: 60),
                ),
                Text(
                  "S",
                  style: GoogleFonts.permanentMarker(
                      color: Colors.blue, fontSize: 40),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  imagesSplashScren[currentIndex],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SpinKitCubeGrid(
              color: Colors.orange,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
