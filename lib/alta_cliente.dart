import 'package:flutter/material.dart';

import 'main.dart';

class ClientPage extends StatefulWidget {
  @override
  _AltaCliente createState() => new _AltaCliente();
}

class _AltaCliente extends State<ClientPage> {
  final GlobalKey<FormState> _keyFormClient = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _keyFormScal = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyFormScal,
      appBar: AppBar(
        title: Text('Alta cliente'),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
          child: new Form(
              key: _keyFormClient,
              autovalidate: false,
              child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.assignment_ind),
                  hintText: 'Ingresa RFC.',
                  labelText: 'RFC',
                ),
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Ingresa nombre completo.',
                  labelText: 'Nombre',
                ),
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Ingrese un correo electronico.',
                  labelText: 'Correo electronico',
                ),
                validator: (value) => isValidEmail(value) ? null : 'Ingrese un correo valido.',
                keyboardType: TextInputType.emailAddress,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: new RaisedButton(
                  elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    splashColor: Colors.black26,
                    child: const Text('Guardar'),
                    color: Theme.of(context).accentColor,
                    onPressed: (){_neverSatisfied();}),

              ),
            ],
          )),
      ),
    );
  }

  Future<void> _neverSatisfied()  {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alta de cliente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Esta seguro de crear el cliente?.')],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Bien hecho! El usuario ha sido creado.'),
                );
                _keyFormScal.currentState.showSnackBar(snackBar);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
}