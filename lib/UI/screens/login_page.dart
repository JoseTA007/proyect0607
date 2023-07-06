import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:lym_proyect/UI/base_datos/list_clientes.dart';
import 'package:lym_proyect/UI/images_login/list_image.dart';
import 'package:lym_proyect/UI/images_login/list_wasap.dart';
import 'package:lym_proyect/UI/widget_wasap/launcher_wasap.dart';
import 'package:http/http.dart' as http;

class Iniciar extends StatefulWidget {
  static String id = 'iniciar_page';
  const Iniciar({Key? key}) : super(key: key);

  @override
  State<Iniciar> createState() => _IniciarState();
}

class _IniciarState extends State<Iniciar> with SingleTickerProviderStateMixin {
  final _formKeyLogin = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// IMAGEN Y BORDE
  int currentIndex = 0;
  int currentIndexWasap = 0;
  Timer? timer, timer2;

  Color borderColor = Colors.white54;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % imagesLogin.length;
        //currentIndexWasap = (currentIndexWasap + 1) % imagesWasap.length;
        // Actualizar el color del borde
        if (currentIndex == 0 | 1) {
          borderColor = Colors.white54;
        } else if (currentIndex == 2 | 3) {
          borderColor = Colors.blue;
        } else if (currentIndex == 4 | 5) {
          borderColor = Colors.black;
        }
      });
    });
    timer2 = Timer.periodic(const Duration(milliseconds: 800), (Timer timer) {
      setState(() {
        currentIndexWasap = (currentIndexWasap + 1) % imagesWasap.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //R1 COLOR DE FONDO
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  //R2 LOGO DE LA EMPRESA
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/imagenes/logo_LyM.png',
                      height: 200,
                    ),
                  ),
                  Form(
                    key: _formKeyLogin,
                    //R3 FONDO SECUNDARIO COLOR VERDE
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      //R3 FONDO SECUNDARIO COLOR VERDE
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: borderColor,
                              width: 2,
                            )),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 5.0,
                            ),
                            // R3.1
                            //  CORREO ELECTRONICO
                            //
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autofocus: false,
                                      enableInteractiveSelection: false,
                                      obscureText: false,
                                      //R3.5.3 MENSAJE DE ADVERTENCIA CAMPO VACIO
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "El correo electronico es obligatorio";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          //R3.1.1 ICONO EMAIL
                                          icon: const Icon(
                                            Icons.email,
                                            color: Colors.black,
                                          ),

                                          //3.1.4 NOMBRE DEL TEXT FORM FIELD
                                          labelText: 'CORREO ELECTRONICO',
                                          labelStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          //3.2.1 FOCUS LABEL
                                          hintText: 'ejemplo@correo.com',
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              //R3.1.2 BORDES REDONDEADOS
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              //R3.1.3 COLOR DEL BORDE
                                              borderSide: const BorderSide(
                                                  color: Colors.white)),
                                          focusedBorder: OutlineInputBorder(
                                              //R3.2.2 BORDES REDONDEADOS
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.red))),
                                    ),
                                  ],
                                )),
                            //R3.3 ESPACIO ENTRE TEXT FROM FIELD
                            const SizedBox(
                              height: 15.0,
                            ),
                            //R3.4
                            //  CONTRASEÑA
                            //
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                enableInteractiveSelection: false,
                                autofocus: false,
                                keyboardType: TextInputType.visiblePassword,
                                //R3.5.3 MENSAJE DE ADVERTENCIA CAMPO VACIO
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Tu contraseña es obligatoria";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    //R3.4.1 ICONO LOCK
                                    icon: const Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        //R3.4.2 BORDES REDONDEADOS
                                        borderRadius: BorderRadius.circular(10),
                                        //R3.4.3 COLOR BORDE STANDBY
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    //R3.4.4
                                    labelText: 'CONTRASEÑA',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    //R3.4.5
                                    hintText: 'Colocar contraseña',
                                    filled: true,
                                    //R3.4.6 BORDE REDONDEADO Y COLOR ROJO
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red))),
                              ),
                            ),
                            //R3.6.1 SEPARACION ENTRE TEXT FROM FIELD Y "OLVIDASTES TU CONTRASEÑA"
                            const SizedBox(
                              height: 10.0,
                            ),
                            //R3.6
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: olvidoContrasena(),
                              ),
                            ),
                            //R3.7.1
                            const SizedBox(
                              height: 10.0,
                            ),
                            //R3.7 BOTONES HORIZONTALES
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //
                                //  BOTON INGRESAR
                                //R3.7.2
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green.shade900,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            side: const BorderSide(
                                                color: Colors.white))),
                                    onPressed: () {
                                      login();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15.0),
                                      child: const Text(
                                        'INGRESAR',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    )),
                                //R3.7.3 ESPACIO ENTRE BOTONES
                                const SizedBox(
                                  width: 20,
                                ),
                                //
                                //  BOTON INGRESAR
                                //
                                bottonRegistrate(),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //
                            //  BOTON CONTINUAR COMO INVITADO
                            //
                            invitado(),
                            //R3.9.1
                            const SizedBox(
                              height: 15.0,
                            ),
                            //R3.9.2 IMAGEN GIF
                            /*Image.asset(
                        "assets/imagenes/shop.gif",
                        height: 200,
                        width: 200,
                      ),*/
                            // IMAGENES
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.asset(imagesLogin[currentIndex]),
                            ),
                            //R3.10 TERMINOS Y CONDICIONES
                            Center(
                                child: Align(
                              alignment: Alignment.center,
                              child: terminosYcondiciones(),
                            )),
                            //R3.10.1
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: FloatingActionButton.large(
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    enviarMensajeWhastApp(context);
                  },
                  child: Image.asset(
                    imagesWasap[currentIndexWasap],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //VALIDACION PARA INGRESAR

  Future<void> login() async {
    // Conectarse a la base de datos MongoDB
    const baseUrl = 'https://apiserver0607.onrender.com/api/';
    const apiUrl = '${baseUrl}login';
    /* const apiUrl = 'http://192.168.1.21:2000/api/login'; */

    final Map<String, dynamic> data = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), body: data);
      if (response.statusCode == 200) {
        // Inicio de sesión exitoso
        debugPrint('Inicio de sesión exitoso');
        // Realiza las acciones necesarias después de iniciar sesión
        // Parsea la respuesta JSON
        final responseData = json.decode(response.body);
        // Obtiene el ID del usuario y el rol
        final userId = responseData['userId'];
        final isAdmin = responseData['isAdmin'];
        // Realiza las acciones necesarias después de iniciar sesión
        if (isAdmin) {
          // Usuario es administrador
          // Realizar acciones para administradores
          Navigator.pushNamed(context, '/crudproducts_admin',
              arguments: {'userId': userId.toString()});
        } else {
          // Usuario no es administrador
          // Realizar acciones para usuarios normales
          /* Navigator.pushNamed(context, '/market_page', arguments: {
            'userId': userId.toString()
          } /* ,
              arguments: {'userId': userId.toString()} */
              ); */
          Navigator.pushNamed(context, '/bienvenida',
              arguments: {'userId': userId.toString()});
        }
      } else if (response.statusCode == 401) {
        // Muestra un mensaje de error al usuario
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Correo electronico o password incorrecto'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        debugPrint('Error en el servidor');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Error en el servidor'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      debugPrint('Error en la solicitud HTTP: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Error en la solicitud HTTP'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

//R3.6
olvidoContrasena() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          child: Text(
            'Olvidastes tu contraseña?',
            style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/olvido_contrasena_page',
                arguments: Clientes(
                    nombre: "",
                    apellidos: "",
                    password: "",
                    rePassword: "",
                    dni: "",
                    email: "",
                    isAdmin: '',
                    viewHistory: ''));
          },
        );
      });
}

//R3.7.4 BOTON REGISTRATE
bottonRegistrate() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.white))),
            onPressed: () {
              Navigator.pushNamed(context, '/registrate_page',
                  arguments: Clientes(
                      id: 0,
                      nombre: "",
                      apellidos: "",
                      password: "",
                      rePassword: "",
                      dni: "",
                      email: "",
                      isAdmin: '',
                      viewHistory: ''));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
                child: const Text(
                  'REGISTRATE',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )));
      });
}

//R3.8.2 BOTON CONTINUAR COMO INVITADO
invitado() {
  String userId = 'Invitado';

  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.red))),
            onPressed: () {
              Navigator.pushNamed(context, "/market_page",
                  arguments: {'userId': userId.toString()});
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
              child: const Text(
                'CONTINUAR COMO INVITADO',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ));
      });
}

//R3.10 TERMINOS Y CONDICIONES
terminosYcondiciones() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          child: Text(
            'Terminos y condiciones',
            style: TextStyle(
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/terminos_condiciones_page');
          },
        );
      });
}
