/* import 'dart:core';
import 'package:lym_proyect/UI/base_datos/list_clientes.dart';
import 'package:lym_proyect/UI/base_datos/db_lym.dart';
import 'package:flutter/material.dart';

class VerClientes extends StatelessWidget {
  const VerClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Clientes"),
        ),
        /*floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/editar",
                arguments: Cliente(id: 0, nombre: "", apellidos: ""));
          },
        ),*/
        body: const Lista());
  }
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  MiLista createState() => MiLista();
}

class MiLista extends State<Lista> {
  List<Clientes> cliente = [];

  @override
  void initState() {
    cargaClientes();
    super.initState();
  }

  cargaClientes() async {
    List<Clientes> auxCliente = await DB.cliente();

    setState(() {
      cliente = auxCliente;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cliente.length,
        itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
                color: Colors.red,
                padding: const EdgeInsets.only(left: 5),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.delete, color: Colors.white))),
            onDismissed: (direction) {
              DB.delete(cliente[i]);
            },
            child: ListTile(
                title: Text(
                    "${cliente[i].id} ${cliente[i].nombre} ${cliente[i].apellidos} "),
                trailing: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registrate_page',
                          arguments: cliente[i]);
                    },
                    child: const Icon(Icons.edit)))));
  }
}
/*  */ */