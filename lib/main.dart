import 'package:flutter/material.dart';
import 'package:lym_proyect/UI/screens/bienvenida.dart';
import 'package:lym_proyect/UI/screens/crudproducts_admin_screen.dart';

import 'package:lym_proyect/UI/screens/market.dart';
import 'package:lym_proyect/UI/screens/olvido_contrasena_page.dart';
import 'package:lym_proyect/UI/screens/productos/carrito_producto.dart';
import 'package:lym_proyect/UI/screens/productos/market_producto.dart';
import 'package:lym_proyect/UI/screens/registro_clientes.dart';

import 'package:lym_proyect/UI/screens/login_page.dart';
import 'package:lym_proyect/UI/screens/splash_screen.dart';

import 'UI/screens/terminos_condiciones_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //widgets tema de aplicacion y opciones de navegacion
      debugShowCheckedModeBanner: false, //quitar etiqueta de debug

      title: 'flutter demo',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: '/splash_scren', // ruta inicial
      routes: {
        '/login_page': (context) => const Iniciar(),
        '/olvido_contrasena_page': (context) => const OlvidoContrasenaPage(),
        '/registrate_page': (context) => const AgregarCliente(),
        /* '/listado_clientes': (context) => const VerClientes(), */
        '/market_page': (context) => const MarketPage(),
        '/terminos_condiciones_page': (context) =>
            const TerminosYcondicionesPage(),
        '/market_producto': (context) => const MarketProducto(),
        '/splash_scren': (context) => const SplashScreen(),
        '/crudproducts_admin': (context) => const CrudProducts(
              key: ValueKey('crudproducts_admin'),
            ),
        '/carrito_producto': (context) => const CarritoCompra(),
        '/bienvenida': (context) => const Bienvenida(
              userId: '',
            ),
      }, //nombres de rutas navegables
    );
  }
}
