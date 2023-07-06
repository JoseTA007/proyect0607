import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/api_mongodb/api_products.dart';

class CreateData extends StatefulWidget {
  const CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nameController = TextEditingController();
  var brandController = TextEditingController();
  var codeController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  var imageDefaultController = TextEditingController();
  var imageFrontController = TextEditingController();

  bool isButtonEnabled = false;
  bool isChecked = false;
  Color normalColor = Colors.red;

  //TODO VENTANA DE DIALOGO
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameController.addListener(updateButtonState);
    brandController.addListener(updateButtonState);
    codeController.addListener(updateButtonState);
    priceController.addListener(updateButtonState);
    descController.addListener(updateButtonState);
    imageDefaultController.addListener(updateButtonState);
    imageFrontController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          brandController.text.isNotEmpty &&
          codeController.text.isNotEmpty &&
          priceController.text.isNotEmpty &&
          descController.text.isNotEmpty &&
          imageDefaultController.text.isNotEmpty &&
          imageFrontController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    brandController.dispose();
    codeController.dispose();
    priceController.dispose();
    descController.dispose();
    imageDefaultController.dispose();
    imageFrontController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'CREATE PRODUCT',
            textAlign: TextAlign.center,
            style: GoogleFonts.caveat(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 2),
          ),
          margin: const EdgeInsets.only(
            left: 30,
            top: 50,
            right: 30,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'AGREGAR UN PRODUCTO NUEVO',
                textAlign: TextAlign.center,
                style: GoogleFonts.permanentMarker(
                  textStyle: TextStyle(
                    color: Colors.purple.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
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
                    hintText: "Marca del producto",
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
                    hintText: "Nombre del producto",
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
                    hintText: "Codigo del producto",
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
                    hintText: "Precio del producto",
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
                  controller: descController,
                  decoration: InputDecoration(
                    hintText: "Descripcion del producto",
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
                    hintText: "Image_default url del producto",
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
                    hintText: "Image_front url del producto",
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
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: normalColor,
                ),
                child: CheckboxListTile(
                  title: Text(
                    'Deseas agregar un producto?',
                    style: TextStyle(
                      color: normalColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                  value: isChecked,
                  activeColor: normalColor,
                  onChanged: isButtonEnabled
                      ? (value) {
                          setState(() {
                            isChecked = value!;
                            if (isChecked) {
                              normalColor = Colors.blue;
                            } else {
                              normalColor = Colors.red;
                            }
                          });
                        }
                      : null,
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 70, right: 70),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: isButtonEnabled && isChecked
                      ? () {
                          var data = {
                            'pname': nameController.text,
                            'pbrand': brandController.text,
                            'pcode': codeController.text,
                            'pprice': priceController.text,
                            'pdesc': descController.text,
                            'pimage_default': imageDefaultController.text,
                            'pimage_front': imageFrontController.text,
                          };

                          ApiProducts.addProduct(data);

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Producto agregado'),
                                content: const Text(
                                    'El producto se ha agregado correctamente.'),
                                actions: [
                                  TextButton(
                                    child: const Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      nameController.clear();
                                      brandController.clear();
                                      codeController.clear();
                                      priceController.clear();
                                      descController.clear();
                                      imageDefaultController.clear();
                                      imageFrontController.clear();

                                      setState(() {
                                        isButtonEnabled = false;
                                        isChecked = false;
                                        normalColor = Colors.red;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Text(
                        "AGREGAR PRODUCTO",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreateData(),
  ));
}
