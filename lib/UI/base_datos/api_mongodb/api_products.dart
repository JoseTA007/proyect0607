import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lym_proyect/UI/base_datos/list_products.dart';

class ApiProducts {
  static const baseUrl = 'https://apiserver0607.onrender.com/api/';
  /* static const baseUrl = 'http://192.168.1.21:2000/api/'; */

  //TODO POST

  static addProduct(Map pdata) async {
    /* print(pdata); */
    var url = Uri.parse('${baseUrl}add_product');

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        debugPrint(data);
      } else {
        debugPrint('Failed to get response');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //TODO GET
  static Future<List<Product>> getProduct() async {
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_products");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        for (var value in data) {
          products.add(
            Product(
                name: value['pname'],
                brand: value['pbrand'],
                code: value['pcode'],
                desc: value['pdesc'],
                price: value['pprice'],
                id: value['_id'].toString(), // Utiliza '_id' en lugar de 'id'
                imageDefault: value['pimage_default'],
                imageFront: value['pimage_front']),
          );
        }
        return products;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  //TODO update method

  static updateProduct(id, body) async {
    var url = Uri.parse('${baseUrl}update_product/$id');

    final res = await http.patch(url, body: body);
    if (res.statusCode == 200) {
      debugPrint(jsonDecode(res.body));
    } else {
      debugPrint('Failed to update data');
    }
  }

  //TODO delete method
  static deleteProduct(id) async {
    var url = Uri.parse('${baseUrl}delete_product/$id');

    final res = await http.delete(url);

    if (res.statusCode == 200) {
      debugPrint('Product deleted successfully');
    } else {
      try {
        var data = jsonDecode(res.body);
        debugPrint('Failed to delete product: $data');
      } catch (e) {
        debugPrint('Failed to delete product: ${res.body}');
      }
    }
  }

  //TODO BUSCAR
  static Future<List<dynamic>> buscarProductos(String query) async {
    final url = Uri.parse('${baseUrl}search_products?search=$query');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> productos = jsonDecode(response.body);
      return productos;
    } else {
      throw Exception('Error al buscar productos');
    }
  }
}

class FetchData extends StatelessWidget {
  const FetchData({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Product>>(
        future: ApiProducts.getProduct(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data!;

            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].desc}"),
                  trailing: Text("\$ ${pdata[index].price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
