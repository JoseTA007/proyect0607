import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MarketProducto extends StatefulWidget {
  const MarketProducto({super.key});

  @override
  State<MarketProducto> createState() => _MarketProductoState();
}

class _MarketProductoState extends State<MarketProducto> {
  int selectTallaCheckBox = 0;
  String? productId;
  String? productName;
  String? productBrand;
  String? productPrice;
  String? productDesc;
  String? productImagefront;
  String? productImageDefault;
  String? productCode;

  String imagenSeleccionada = "";

  List<Producto> carrito = []; // Lista de productos en el carrito

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

  void agregarAlCarrito() {
    Producto producto = Producto(
      id: productId,
      nombre: productName,
      marca: productBrand,
      precio: productPrice,
    );

    setState(() {
      carrito.add(producto);
    });

    // Mostrar un mensaje o realizar alguna acción adicional
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Producto Agregado'),
          content:
              const Text('El producto ha sido agregado al carrito de compra.'),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                      Text(
                        '$productBrand',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        '$productName',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imagenSeleccionada =
                                            productImageDefault!;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.red)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            '$productImageDefault',
                                            height: 50,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imagenSeleccionada = productImagefront!;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.red)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            '$productImagefront',
                                            height: 50,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 175,
                                width: 175,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.red)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      imagenSeleccionada,
                                      height: 175,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'PRECIO \n S/. $productPrice \n COLOR: ',
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                const Text(
                                  'TALLA',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    const Text('38'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _onCheckboxChanged(1);
                                          });
                                        }),
                                    const Text('40'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _onCheckboxChanged(2);
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('42'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 3,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _onCheckboxChanged(3);
                                          });
                                        }),
                                    const Text('44'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 4,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _onCheckboxChanged(4);
                                          });
                                        }),
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
                    /* ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/carrito_producto',
                            arguments: {
                              'productId': productId.toString(),
                              'productBrand': productBrand,
                              'productName': productName,
                              'productPrice': productPrice,
                              'productDesc': productDesc,
                              'productImagefront': productImagefront,
                              'productImageDefault': productImageDefault,
                              'productCode': productCode,
                            });
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
                        'AGREGAR',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ), */
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

class Producto {
  final String? id;
  final String? nombre;
  final String? marca;
  final String? precio;

  Producto({this.id, this.nombre, this.marca, this.precio});
}
