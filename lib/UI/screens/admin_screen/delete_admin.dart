import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/api_mongodb/api_products.dart';
import 'package:lym_proyect/UI/base_datos/list_products.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  BuildContext? dialogContext;
  @override
  Widget build(BuildContext context) {
    dialogContext = context;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        title: Center(
            child: Text(
          "DELETE PRODUCT",
          style: GoogleFonts.caveat(
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )),
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      ),
      body: FutureBuilder(
          future: ApiProducts.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snaphot) {
            if (!snaphot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Product> pdata = snaphot.data;

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.55),
                itemCount: pdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(20),
                    color: Colors.green.shade50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.red, width: 2)),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Text(
                                  'Marca: ${pdata[index].brand}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade900,
                                      fontSize: 10),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Producto: ${pdata[index].name}',
                                    overflow: TextOverflow
                                        .ellipsis, //si el texto es demasiado largo se indica ....
                                    maxLines:
                                        1, // se precisa que solo sera una linea
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                        fontSize: 9),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Codigo: ${pdata[index].code}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                        fontSize: 9),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Precio: S/. ${pdata[index].price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                        fontSize: 9),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Id: ${pdata[index].id}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                        fontSize: 9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "${pdata[index].imageDefault}",
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        /* ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/imagenes/foto2.jpg',
                            height: 90,
                            width: 90,
                          ),
                        ), */
                        const SizedBox(height: 5),
                        Container(
                            height: 78,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.red, width: 2)),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Descripcion:',
                                      style: TextStyle(
                                          color: Colors.green.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                ),
                                Text(
                                  '${pdata[index].desc}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.purple.shade300,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.blue.shade900))),
                              onPressed: () async {
                                await ApiProducts.deleteProduct(
                                    pdata[index].id);
                                pdata.removeAt(index);
                                setState(() {});

                                showDialog(
                                    context: dialogContext!,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Producto eliminado'),
                                        content: const Text(
                                            'El producto se elimino correctamente mediante un soft-delete, si deseas recuperar la informacion comunicate con tu administrador'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cerrar'))
                                        ],
                                      );
                                    });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 10,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    'ELIMINAR PRODUCTO',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
