import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
    String mensaje = "producto XXXXAAAAEEE";

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
