import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/api_mongodb/api_products.dart';
import 'package:lym_proyect/UI/base_datos/list_products.dart';

class GetData extends StatelessWidget {
  const GetData({super.key});

  // const GetData({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'READ PRODUCT',
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
      body: FutureBuilder(
        future: ApiProducts.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text('Error'),
                ],
              ),
            );
          } else {
            List<Product> pdata = snapshot.data;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("MARCA: ${pdata[index].brand}"),
                      Text(
                        "PRODUCTO: ${pdata[index].name}",
                        overflow: TextOverflow
                            .ellipsis, //si el texto es demasiado largo se indica ....
                        maxLines: 1,
                      ),
                      Text("CODIGO: ${pdata[index].code}"),
                      Text("\$ ${pdata[index].price}"),
                      Text("ID: ${pdata[index].id}"),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          '${pdata[index].imageDefault}',
                          height: 100,
                          width: 100,
                        ),
                      ),
                      /* Image.asset(
                        'assets/imagenes/foto1.jpg',
                        height: 100,
                        width: 100,
                      ), */
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "DESCRIPCION: ${pdata[index].desc}",
                          overflow: TextOverflow
                              .ellipsis, //si el texto es demasiado largo se indica ....
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
