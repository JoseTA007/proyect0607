import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/api_mongodb/api_products.dart';
import 'package:lym_proyect/UI/base_datos/list_products.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.data});
  final Product data;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var brandController = TextEditingController();
  var codeController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  var imageDefaultController = TextEditingController();
  var imageFrontController = TextEditingController();
  String userId = '';

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    brandController.text = widget.data.name.toString();
    codeController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
    imageDefaultController.text = widget.data.imageDefault.toString();
    imageFrontController.text = widget.data.imageFront.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
        title: Center(
          child: Text(
            "EDIT PRODUCT",
            style: GoogleFonts.caveat(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, width: 2),
          ),
          margin: const EdgeInsets.only(
            left: 30,
            top: 100,
            right: 30,
          ),
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: brandController,
                  decoration: InputDecoration(
                    labelText: 'MARCA DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    hintText: "Name Here",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'NOMBRE DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    hintText: "Name Here",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: codeController,
                  decoration: InputDecoration(
                    labelText: 'CODIGO DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    hintText: "Name Here",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'PRECIO DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    hintText: "Price Here",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    hintText: "Desc Here",
                    labelText: 'DESCRIPCION DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: imageDefaultController,
                  decoration: InputDecoration(
                    hintText: "Url image Here",
                    labelText: 'URL DE LA IMAGEN FRONTAL DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: imageFrontController,
                  decoration: InputDecoration(
                    hintText: "Url image Here",
                    labelText: 'URL DE LA IMAGEN TRASERA DEL PRODUCTO',
                    labelStyle: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.red))),
                  onPressed: () {
                    ApiProducts.updateProduct(widget.data.id, {
                      'pname': nameController.text,
                      'pbrand': brandController.text,
                      'pcode': codeController.text,
                      'pdesc': descController.text,
                      'pprice': priceController.text,
                      'id': widget.data.id,
                      'pimage_default': imageDefaultController.text,
                      'pimage_front': imageFrontController.text,
                    });
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Producto actualizado'),
                            content: const Text(
                                'El producto se actualizo correctamente'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/crudproducts_admin',
                                        arguments: {
                                          'userId': userId.toString()
                                        });
                                  },
                                  child: const Text('Cerrar'))
                            ],
                          );
                        });
                  },
                  child: Text(
                    "ACTUALIZAR PRODUCTO",
                    style: TextStyle(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
