import 'package:flutter/material.dart';

import 'alta_cliente.dart';
import 'cliente.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Clientes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                onChanged: (value) {

                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Buscar un cliente",
                    hintText: "Ingrese RFC ó correo",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                children:
                ListTile.divideTiles(context: context, tiles: _buildClientList()).toList(),
              ),
            )

          ],
        ),
      ),floatingActionButton: FloatingActionButton(
      onPressed: (){Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientPage()),
      );},
      tooltip: 'agregar cliente',
      child: Icon(Icons.add),
    )
    );
  }

  List<_ClienteList> _buildClientList() {
    var item = new List<_ClienteList>();
    for (var client in KClientes){
      item.add(new _ClienteList(client));
    }
    return item;
  }

}

class _ClienteList extends ListTile {

  _ClienteList(Cliente cliente):
        super(
          title: Text(cliente.nombre),
          subtitle: Text(cliente.correo),
          leading: CircleAvatar(
            child: Text(cliente.nombre[0]),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){

        }
      );
}

const KClientes = const <Cliente> [
  const Cliente(nombre: "Jhoan ", correo: "jhoan@correo.com"),
  const Cliente(nombre: "Tepox ", correo: "enrique@correo.com"),
  const Cliente(nombre: "Ricardo ", correo: "ricardo.mendez@correo.com"),
  const Cliente(nombre: "Nestor ", correo: "nestor.miranda@correo.com"),
  const Cliente(nombre: "Guadalupe ", correo: "guadalupe.galvan@correo.com"),
  const Cliente(nombre: "Armando ", correo: "armando.martinez@correo.com"),
  const Cliente(nombre: "Jose ", correo: "jose.antonio@correo.com"),
  const Cliente(nombre: "Jose ", correo: "jose.gachuzo@correo.com"),
];
