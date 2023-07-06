import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/api_mongodb/api_products.dart';
import 'package:lym_proyect/UI/base_datos/list_products.dart';
import 'package:http/http.dart' as http;

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  String userId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    obtenerArgumentos();
  }

  void obtenerArgumentos() {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (args.containsKey('userId')) {
      setState(() {
        userId = args['userId'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(40)),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    /* TextFormField(
                        decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Buscar...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    )), */
                    const SizedBox(
                      height: 20,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.pink.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: CarouselSlider(
                        items: [
                          'assets/imagenes/adidas.png',
                          'assets/imagenes/azorti.png',
                          'assets/imagenes/lbel.png',
                          'assets/imagenes/nike.png',
                          'assets/imagenes/puma.png',
                          'assets/imagenes/umbro.png',
                          'assets/imagenes/foto7.jpg',
                        ].map((i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                              //mostrar i
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    i,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 230,
                          autoPlay: true,
                          autoPlayInterval: const Duration(
                            seconds: 2,
                          ),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: ApiProducts.getProduct(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
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
                            return SizedBox(
                              height: 400,
                              child: Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemCount: pdata.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/market_producto',
                                            arguments: {
                                              'productId':
                                                  pdata[index].id.toString(),
                                              'productBrand':
                                                  pdata[index].brand,
                                              'productName': pdata[index].name,
                                              'productPrice':
                                                  pdata[index].price,
                                              'productDesc': pdata[index].desc,
                                              'productImagefront':
                                                  pdata[index].imageFront,
                                              'productImageDefault':
                                                  pdata[index].imageDefault,
                                              'productCode': pdata[index].code,
                                            });
                                      },
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("${pdata[index].brand}"),
                                            Text(
                                              "${pdata[index].name}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text("${pdata[index].price}"),
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.network(
                                                "${pdata[index].imageDefault}",
                                                height: 100,
                                                width: 100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Future<List<dynamic>> searchProducts(String searchTerm) async {
    const baseUrl = 'http://192.168.1.21:2000/api/';
    final url = Uri.parse('${baseUrl}search_products?search=$searchTerm');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products;
    } else {
      throw Exception('Error al buscar productos');
    }
  }
}
