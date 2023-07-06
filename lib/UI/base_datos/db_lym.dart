import 'package:http/http.dart' as http;

class DB {
  static const String apiUrl =
      'https://apiserver0607.onrender.com/api/register_client';

  static Future<void> update(String id, Map<String, dynamic> data) async {
    final uri = Uri.parse(apiUrl); // Convertir la cadena de texto en Uri

    try {
      final response = await http.post(uri, body: data);
      if (response.statusCode == 200) {
        print('Registro actualizado exitosamente');
      } else {
        print('Error al actualizar el registro');
      }
    } catch (e) {
      print('Error al realizar la solicitud HTTP: $e');
    }
  }
}
