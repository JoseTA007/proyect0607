import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bienvenida extends StatefulWidget {
  final String userId;

  const Bienvenida({Key? key, required this.userId}) : super(key: key);

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  String nombre = '';
  String apellidos = '';

  @override
  void initState() {
    super.initState();

    navigateToNextPage(); // Inicia el temporizador para navegar a la siguiente página
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/market_page',
          arguments: {'userId': widget.userId.toString()});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userId = args['userId'];
    print('UserId: $userId');

    fetchUsername(userId);
  }

  void fetchUsername(String userId) async {
    /* const baseUrl = 'http://192.168.1.21:2000/api/'; */
    const baseUrl = 'https://apiserver0607.onrender.com/api/';
    try {
      final response = await http.get(Uri.parse('${baseUrl}client/$userId'));
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        final nombre = userData['nombre'];
        final apellidos = userData['apellidos'];
        setState(() {
          this.nombre = nombre;
          this.apellidos = apellidos;
        });
      } else {
        print(
            'Error al obtener el nombre de usuario. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al obtener el nombre de usuario: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/imagenes/logo_LyM.png',
                        height: 200,
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Text(
                            'Bienvenido $nombre $apellidos, que tengas un hermoso dia.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child:
                                Image.asset('assets/imagenes/bienvenida.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
