import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lym_proyect/UI/screens/admin_screen/create_admin.dart';
import 'package:lym_proyect/UI/screens/admin_screen/delete_admin.dart';
import 'package:lym_proyect/UI/screens/admin_screen/get_admin.dart';

import 'admin_screen/update_admin.dart';

class CrudProducts extends StatefulWidget {
  const CrudProducts({required Key key}) : super(key: key);

  @override
  State<CrudProducts> createState() => _CrudProductsState();
}

class _CrudProductsState extends State<CrudProducts> {
  String userId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    obtenerArgumentos();
  }

  void obtenerArgumentos() {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (args.containsKey('userId')) {
      setState(() {
        userId = args['userId'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        title: Text(
          'IMPORTACIONES LyM ',
          style: GoogleFonts.caveat(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(
                top: 150, bottom: 100, left: 20, right: 20),
            padding: const EdgeInsets.only(left: 50, right: 50),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "CRUD ADMINISTRADOR IMPORTACIONES LyM",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.permanentMarker(
                        textStyle: TextStyle(
                            color: Colors.purple.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                ),
                const SizedBox(height: 50),
                //TODO BOTON AGREGAR
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.red, width: 2)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateData()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Text(
                        "AGREGAR PRODUCTOS(C)",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //TODO BOTON VER PRODUCTOS
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.red, width: 2))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetData(
                          key: ValueKey('get_data'),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                      Text(
                        "VER PRODUCTOS(R)",
                        style: TextStyle(color: Colors.green.shade900),
                      ),
                    ],
                  ),
                ),
                //TODO BOTON EDITAR
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.red, width: 2))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.edit, color: Colors.black),
                      Text(
                        "ACTUALIZAR PRODUCTOS(U)",
                        style: TextStyle(color: Colors.amber.shade900),
                      ),
                    ],
                  ),
                ),
                //TODO BOTON ELIMINACION LOGICA
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.red, width: 2))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeleteScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      Text(
                        "ELIMINAR PRODUCTOS(D)",
                        style: TextStyle(color: Colors.red.shade800),
                      ),
                    ],
                  ),
                ),
                //TODO BOTON REGRESAR AL MARKET
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.red, width: 2))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/market_page',
                        arguments: {'userId': userId.toString()});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      Text(
                        "IR AL MARKET",
                        style: TextStyle(color: Colors.cyan.shade900),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
