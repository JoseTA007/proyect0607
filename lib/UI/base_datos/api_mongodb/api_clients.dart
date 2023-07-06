import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lym_proyect/UI/base_datos/list_clientes.dart';

class ApiClients {
  static const baseUrl = 'https://apiserver0607.onrender.com/api/';
  /* static const baseUrl = 'http://192.168.1.21:2000/api/'; */

  //TODO POST

  static addClient(Map pdata) async {
    /* print(pdata); */
    var url = Uri.parse('${baseUrl}register_client');

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
  static Future<List<Clientes>> getClients() async {
    List<Clientes> clients = [];

    var url = Uri.parse("${baseUrl}get_clients");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        for (var value in data) {
          clients.add(
            Clientes(
                id: value['_id'], // Utiliza '_id' en lugar de 'id'
                nombre: value['pname'],
                apellidos: value['pbrand'],
                password: value['pcode'],
                rePassword: value['pdesc'],
                email: value['pprice'],
                isAdmin: value['pimage_default'],
                dni: '',
                viewHistory: ''),
          );
        }
        return clients;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  //TODO update method

  static updateClient(id, body) async {
    var url = Uri.parse('${baseUrl}update_client/$id');

    final res = await http.patch(url, body: body);
    if (res.statusCode == 200) {
      debugPrint(jsonDecode(res.body));
    } else {
      debugPrint('Failed to update data');
    }
  }

  //TODO delete method
  static deleteClient(id) async {
    var url = Uri.parse('${baseUrl}delete_client/$id');

    final res = await http.delete(url);

    if (res.statusCode == 200) {
      debugPrint('Client deleted successfully');
    } else {
      try {
        var data = jsonDecode(res.body);
        debugPrint('Failed to delete client: $data');
      } catch (e) {
        debugPrint('Failed to delete client: ${res.body}');
      }
    }
  }

  /* //FUNCION PARA VALIDAR EL INGRESO A TRAVES DEL LOGIN
  Future<void> authenticate(String email, String password) async {
    const url = '$baseUrl/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Autenticación exitosa
        final message = responseData['message'];
        final user = responseData['user'];

        debugPrint(message);
        debugPrint(user);
      } else {
        // Error en la autenticación
        final errorMessage = responseData['message'];
        debugPrint(errorMessage);
      }
    } catch (error) {
      // Error de conexión o del servidor
      debugPrint('Error de conexión: $error');
    }
  } */
}

class FetchDataClient extends StatelessWidget {
  const FetchDataClient({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Clientes>>(
        future: ApiClients.getClients(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Clientes>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Clientes> pdata = snapshot.data!;

            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text(pdata[index].nombre),
                  subtitle: Text(pdata[index].apellidos),
                  trailing: Text(pdata[index].email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
