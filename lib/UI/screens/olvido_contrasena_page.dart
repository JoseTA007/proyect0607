import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lym_proyect/UI/screens/login_page.dart';

class OlvidoContrasenaPage extends StatefulWidget {
  const OlvidoContrasenaPage({Key? key}) : super(key: key);

  @override
  OlvidoContrasenaPageState createState() => OlvidoContrasenaPageState();
}

class OlvidoContrasenaPageState extends State<OlvidoContrasenaPage> {
  final _formKeyRecuperarContrasena = GlobalKey<FormState>();
  final TextEditingController eMailController = TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 10, 73, 181),
          title: SizedBox(
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 10, 73, 181),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'IMPORTACIONES LyM',
                      style: GoogleFonts.caveat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
        body: Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  Form(
                    key: _formKeyRecuperarContrasena,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset(
                            'assets/imagenes/logo_LyM.png',
                            height: 200,
                          ),
                        ),
                        Text(
                          'NO RECUERDAS TU CONTRASEÑA?',
                          style: GoogleFonts.rubik(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'No te preocupes!!!, nos sucede a todos. Ingresa tu E-mail y DNI y te ayudaremos.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            fontSize: 18,
                            color: Colors.brown.shade900,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: eMailController,
                            enableInteractiveSelection: false,
                            autofocus: false,
                            textCapitalization: TextCapitalization.characters,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Tu e-mail es obligatorio";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Introduzca su Correo',
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              icon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: dniController,
                            enableInteractiveSelection: false,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Tu dni es obligatorio";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Introduzca su DNI',
                              labelText: 'DNI',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              icon: const Icon(
                                Icons.numbers,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: contrasenaController,
                            enableInteractiveSelection: false,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Tu contraseña es obligatorio";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Introduzca su contraseña nueva',
                              labelText: 'NUEVA CONTRASEÑA',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              icon: const Icon(
                                Icons.numbers,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                enviar();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Contraseña cambiada'),
                                        content: const Text(
                                            'La contraseña se cambió exitosamente.'),
                                        actions: [
                                          TextButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Cerrar el diálogo
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Iniciar()),
                                              ); // Ir a la pantalla de inicio de sesión
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: const Text('ENVIAR'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'NUEVO',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void enviar() async {
    final eMail = eMailController.text;
    final dni = dniController.text;
    final nuevaPassword = contrasenaController.text;

    if (_formKeyRecuperarContrasena.currentState!.validate()) {
      await validarCredenciales(eMail, dni, nuevaPassword);
      // Resto de tu código aquí
    }
  }

  Future<void> validarCredenciales(
      String email, String dni, String nuevaPassword) async {
    const baseUrl = 'https://apiserver0607.onrender.com/api/';
    const apiUrl = '${baseUrl}validar_credenciales';
    /* const baseUrl = 'http://192.168.1.21:2000/api/';
    const url = '${baseUrl}validar_credenciales'; */

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': email, 'dni': dni},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userId = data['userId'] as int;

        // Llamar a la función para generar una nueva contraseña con el userId
        await generarNuevaContrasena(userId.toString(), nuevaPassword);
      } else {
        final mensaje = json.decode(response.body)['mensaje'];
        print('Error: $mensaje');
      }
    } catch (error) {
      print('Error al realizar la solicitud: $error');
    }
  }

  Future<void> generarNuevaContrasena(
      String userId, String nuevaPassword) async {
    const baseUrl = 'https://apiserver0607.onrender.com/api/';

    /* const baseUrl = 'http://192.168.1.21:2000/api/'; */
    final url = '${baseUrl}update_client/${userId.toString()}';

    final body = {'password': nuevaPassword};

    try {
      final response = await http.patch(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == 200) {
        print('Contraseña actualizada correctamente');
      } else {
        print('Error al actualizar la contraseña');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }
}
