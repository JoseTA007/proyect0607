import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CarritoCompra extends StatefulWidget {
  const CarritoCompra({super.key});

  @override
  State<CarritoCompra> createState() => _CarritoCompraState();
}

class _CarritoCompraState extends State<CarritoCompra> {
  int selectTallaCheckBox = 0;
  String? productId;
  String? productName;
  String? productBrand;
  String? productPrice;
  String? productDesc;
  String? productImagefront;
  String? productImageDefault;
  String? productCode;
  String userId = 'Invitado';

  String imagenSeleccionada = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    obtenerArgumentos();
  }

  void obtenerArgumentos() {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      setState(() {
        productId = args['productId'] as String?;
        productName = args['productName'] as String?;
        productBrand = args['productBrand'] as String?;
        productPrice = args['productPrice'] as String?;
        productDesc = args['productDesc'] as String?;
        productImagefront = args['productImagefront'] as String?;
        productImageDefault = args['productImageDefault'] as String?;
        productCode = args['productCode'] as String?;
        imagenSeleccionada = productImageDefault!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 73, 181),
        title: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'IMPORTACIONES LyM ',
              style: GoogleFonts.caveat(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'CARRITO DE COMPRAS',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                const TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        'PRODUCTO',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text('MARCA',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ),
                                    TableCell(
                                      child: Text('PRECIO',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text('$productName'),
                                    ),
                                    TableCell(
                                      child: Text('$productBrand'),
                                    ),
                                    TableCell(
                                      child: Text('S/. $productPrice'),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'DESCRIPCION DEL PRODUCTO \n $productDesc \n CODIGO: $productCode',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        enviarComprarMensajeWhastApp(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900,
                          shadowColor: Colors.yellow,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(
                            color: Colors.red,
                          )),
                      child: const Text(
                        'COMPRAR',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/market_page',
                            arguments: {'userId': userId.toString()});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shadowColor: Colors.white,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(
                            color: Colors.black,
                          )),
                      child: const Text(
                        'MARKET',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple.shade300),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'PRODUCTOS SIMILARES',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      child: Image.asset(
                                        'assets/imagenes/foto2.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Zapatillas nicke')
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      child: Image.asset(
                                        'assets/imagenes/foto6.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Zapatillas nicke')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCheckboxChanged(int checkboxIndex) {
    setState(() {
      selectTallaCheckBox = checkboxIndex;
    });
  }

  void enviarComprarMensajeWhastApp(BuildContext context) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request('POST',
        Uri.parse('https://api.ultramsg.com/instance49326/messages/chat'));
    request.bodyFields = {
      'token': 'mrtcha44qs05aehx',
      'to': '+51952028294',
      'body': 'Deseo comprar lo(s) siguiente(s) productos(s): '
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Abrir la aplicación de WhatsApp
      String telefono = "+51952028294";
      String mensaje =
          "Saludos IMPORTACIONES LyM, deseo realizar la compra de $productName, \nmarca: $productBrand, \ncodigo: $productCode, \nprecio: S/. $productPrice";

      String url =
          "whatsapp://send?phone=$telefono&text=${Uri.encodeComponent(mensaje)}";

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('No se pudo abrir WhatsApp.'),
              actions: [
                TextButton(
                  child: const Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      Text("${response.reasonPhrase}");
    }
  }
}
