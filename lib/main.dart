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
            backgroundColor: getColor(cliente.nombre[0]),
            child: Text(cliente.nombre[0], style: TextStyle(color: Colors.white) ,),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){

        }
      );

  static Color getColor(String letraInicial) {
    var colores_letra_inicial = {
      "A" : Colors.pink, "B" : Colors.pink[800],
      "C":Colors.red, "D" : Colors.red[800],
      "E" : Colors.orange, "F" : Colors.orange[800],
      "G" : Colors.amber, "H" : Colors.yellow,
      "I" : Colors.lime, "J" : Colors.lime[800] ,
      "K" : Colors.lightGreen, "L" : Colors.lightGreen[800],
      "M" : Colors.green, "N" : Colors.green[900],
      "Ñ" : Colors.cyan, "O" : Colors.cyan[800],
      "P" : Colors.lightBlue, "Q" : Colors.lightBlue[900],
      "R" : Colors.grey, "S" : Colors.grey[900],
      "T" : Colors.indigo, "U" : Colors.indigo[800],
      "V" : Colors.purple, "W" : Colors.purple[800],
      "X" : Colors.brown, "Y" : Colors.brown[800],
      "Z" : Colors.blueGrey};
    return colores_letra_inicial[letraInicial];
  }
}

const KClientes = const <Cliente> [
  const Cliente(nombre: "Armando ", correo: "armando.martinez@correo.com"),
  const Cliente(nombre: "Bruno ", correo: "Bruno@correo.com"),
  const Cliente(nombre: "Carlos ", correo: "Carlos@correo.com"),
  const Cliente(nombre: "Dario ", correo: "Dario@correo.com"),
  const Cliente(nombre: "Ernesto ", correo: "Ernesto@correo.com"),
  const Cliente(nombre: "Fatima ", correo: "Fatima@correo.com"),
  const Cliente(nombre: "Guadalupe ", correo: "guadalupe.galvan@correo.com"),
  const Cliente(nombre: "Gabriel ", correo: "Gabriel@correo.com"),
  const Cliente(nombre: "Hortencia ", correo: "Hortencia@correo.com"),
  const Cliente(nombre: "Irais ", correo: "Irais@correo.com"),
  const Cliente(nombre: "Jhoan ", correo: "jhoan@correo.com"),
  const Cliente(nombre: "Karen ", correo: "Karen@correo.com"),
  const Cliente(nombre: "Lulu ", correo: "Lulu@correo.com"),
  const Cliente(nombre: "Mario ", correo: "Mario@correo.com"),
  const Cliente(nombre: "Nancy ", correo: "Nancy@correo.com"),
  const Cliente(nombre: "Nestor ", correo: "nestor.miranda@correo.com"),
  const Cliente(nombre: "Ñu ", correo: "Ñu@correo.com"),
  const Cliente(nombre: "Olga ", correo: "Olga@correo.com"),
  const Cliente(nombre: "Pedro ", correo: "Pedro@correo.com"),
  const Cliente(nombre: "Quintana ", correo: "Quintana@correo.com"),
  const Cliente(nombre: "Ricardo ", correo: "ricardo.mendez@correo.com"),
  const Cliente(nombre: "Sonia ", correo: "Sonia@correo.com"),
  const Cliente(nombre: "Tepox ", correo: "enrique@correo.com"),
  const Cliente(nombre: "Uriel ", correo: "Uriel@correo.com"),
  const Cliente(nombre: "Vanesa ", correo: "Vanesa@correo.com"),
  const Cliente(nombre: "Wolf ", correo: "Wolf@correo.com"),
  const Cliente(nombre: "Xe ", correo: "Xe@correo.com"),
  const Cliente(nombre: "Yolanda ", correo: "Yolanda@correo.com"),
  const Cliente(nombre: "Zaria ", correo: "Zaria@correo.com"),

];
