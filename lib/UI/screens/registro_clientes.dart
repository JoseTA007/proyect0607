import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/db_lym.dart';

import 'package:lym_proyect/UI/base_datos/list_clientes.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class AgregarCliente extends StatefulWidget {
  const AgregarCliente({super.key});

  @override
  State<AgregarCliente> createState() => _AgregarClienteState();
}

class _AgregarClienteState extends State<AgregarCliente> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final comfirmarContrasenaController = TextEditingController();
  final dniController = TextEditingController();
  final eMailController = TextEditingController();
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    Clientes cliente = ModalRoute.of(context)?.settings.arguments as Clientes;
    nombreController.text = cliente.nombre;
    apellidoController.text = cliente.apellidos;
    contrasenaController.text = cliente.password;
    comfirmarContrasenaController.text = cliente.rePassword;
    dniController.text = cliente.dni;
    eMailController.text = cliente.email;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 73, 181),
        title: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'IMPORTACIONES LyM',
              style: GoogleFonts.caveat(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
          floating: true,
          pinned: true,
          automaticallyImplyLeading: false,
          expandedHeight: 300,
          centerTitle: true,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    'assets/imagenes/logo_LyM.png',
                    height: 200,
                    width: 200,
                  ),
                )),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'REGISTRO DE CLIENTES',
                          style: GoogleFonts.caveat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //
                        //    TEXTFROMFIELD

                        //      NOMBRE
                        TextFormField(
                          controller: nombreController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El nombre es obligatorio";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Nombre",
                            hintText: 'Ingresa tu nombre',
                            prefixIcon: Icon(Icons.person_outlined),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  APELLIDOS
                        //
                        TextFormField(
                          controller: apellidoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El apellido es obligatoria";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Apellidos",
                            hintText: 'Ingresa tus Apellidos',
                            prefixIcon: Icon(Icons.person_outlined),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  CONTRASEÑA
                        //
                        TextFormField(
                          controller: contrasenaController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "La contrasena es obligatoria";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Contraseña",
                            hintText: 'Ingresa tu contraseña',
                            prefixIcon: Icon(Icons.password),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  COMFIRMAR CONTRASEÑA
                        //
                        TextFormField(
                          controller: comfirmarContrasenaController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "La confirmación de contraseña es requerida.";
                            }
                            if (value != contrasenaController.text) {
                              return 'Las contraseñas no coinciden.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Comfirmar contraseña",
                            hintText: 'Ingresa tu contraseña nuevamente',
                            prefixIcon: Icon(Icons.lock),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  DNI
                        //
                        TextFormField(
                          controller: dniController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Tu dni es obligatorio";
                            }
                            if (!validarDNI(value)) {
                              return "DNI invalido";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Dni",
                            hintText: 'Ingresa tu dni',
                            prefixIcon: Icon(Icons.numbers),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  CORREO ELECTRONICO
                        //
                        TextFormField(
                          controller: eMailController,
                          validator: (value) {
                            String email = eMailController.text;
                            if (value!.isEmpty) {
                              return "Tu E-mail es obligatorio";
                            }
                            if (!EmailValidator.validate(email)) {
                              return "La dirección de correo electrónico no es válida";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "E-mail",
                            hintText: 'Ingresa tu E-mail',
                            prefixIcon: Icon(Icons.email),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                            onPressed: /* isButtonEnabled() */
                                /* ? */ () {
                              if (_formKey.currentState!.validate()) {
                                // Si el formulario es válido, se actualiza el cliente en la base de datos.
                                String nombre = nombreController.text;
                                String apellido = apellidoController.text;
                                String contrasena = contrasenaController.text;
                                String confirmarContrasena =
                                    comfirmarContrasenaController.text;
                                String dni = dniController.text;
                                String email = eMailController.text;

                                Map<String, dynamic> datosActualizados = {
                                  "nombre": nombre,
                                  "apellidos": apellido,
                                  "password": contrasena,
                                  "rePassword": confirmarContrasena,
                                  "dni": dni,
                                  "email": email,
                                };

                                // Llamada al método 'update' de la clase 'DB' con los argumentos necesarios.
                                DB.update(
                                    cliente.id.toString(), datosActualizados);

                                // Regresar a la pantalla anterior
                                Navigator.pop(context);
                              }
                            },
                            /* : null, */
                            child: const Text("Guardar")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ]),
    ));
  }

  bool validarDNI(String value) {
    String dni = dniController.text;
    if (dni.length != 8) {
      return false;
    }
    try {
      int suma = 0;
      for (int i = 0; i < 7; i++) {
        suma += int.parse(dni[i]) * (i + 2);
      }
      int verification = (11 - (suma % 11)) % 10;
      return verification == int.parse(dni[7]);
    } catch (error) {
      return false;
    }
  }

  /* bool isButtonEnabled() {
    return isCheckboxChecked &&
        nombreController.text.isNotEmpty &&
        apellidoController.text.isNotEmpty &&
        contrasenaController.text.isNotEmpty &&
        comfirmarContrasenaController.text.isNotEmpty &&
        dniController.text.isNotEmpty &&
        eMailController.text.isNotEmpty;
  } */
}
