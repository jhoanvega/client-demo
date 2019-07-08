import 'package:flutter/material.dart';
import 'main.dart';

class ClientPage extends StatefulWidget {
  @override
  _AltaCliente createState() => new _AltaCliente();
}

class _AltaCliente extends State<ClientPage> {
  final GlobalKey<FormState> _keyFormClient = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _keyFormScal = new GlobalKey<ScaffoldState>();
  List<String> _colonias = new List<String>();
  String coloniaSelected;
  bool _visible = false;
  FocusNode myFocusNode;

  @override
  void initState() {
    _colonias.addAll(["Seleccione una colonia", "Villas de santiago", "Sauces", "Lomas de Casa blanca"]);
    coloniaSelected = "Seleccione una colonia";
    myFocusNode = new FocusNode();
  }

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
                 TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.assignment_ind),
                    hintText: 'Ingresa RFC.',
                    labelText: 'RFC',
                  ),
                ),
                 TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Ingresa razon social.',
                    labelText: 'Razon social',
                  ),
                ),
                 TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Ingrese un correo electronico.',
                    labelText: 'Correo electronico',
                  ),
                  validator: (value) =>
                      isValidEmail(value) ? null : 'Ingrese un correo valido.',
                  keyboardType: TextInputType.emailAddress,
                ),TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Ingrese el telefono.',
                    labelText: 'Telefono de contacto',
                  ),
                  validator: (value) =>
                  isValidEmail(value) ? null : 'Ingrese un correo valido.',
                  keyboardType: TextInputType.emailAddress,
                ), FlatButton.icon(onPressed: (){
                  setState(() {
                    _visible = !_visible;
                    FocusScope.of(context).requestFocus(myFocusNode);
                  });
                }, icon: Icon(Icons.home), label: new Text("Presione aquí para agregar la direccion"),),

                 Visibility(
                   visible: _visible,
                   child: TextFormField(
                     focusNode: myFocusNode,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.edit_location),
                      hintText: 'Ingrese un codigo postal',
                      labelText: 'Codigo postal',
                    ),
                    validator: (value) =>
                        isValidEmail(value) ? null : 'Ingrese un codigo postal.',
                    keyboardType: TextInputType.emailAddress,
                ),
                 ),
                 Visibility(
                   visible: _visible,
                   child: DropdownButtonFormField(
                     validator: (value){
                       if(value == "Seleccione una colonia"){
                         return "Seleccione una colonia del listado";
                       }
                     },
                     decoration: InputDecoration(icon: Icon(Icons.edit_location)),
                    value: coloniaSelected,
                     hint: new Text("Seleccione una colonia"),
                     items: _colonias
                      .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                        )).toList(),
                       onChanged: (value) {
                         setState(() {
                           coloniaSelected = value;
                         });
                       }
                ),
                 ),
                 Visibility(
                   visible: _visible,
                   child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.edit_location),
                      hintText: 'Ingrese la calle',
                      labelText: 'Calle',
                    ),
                    validator: (value) =>
                        isValidEmail(value) ? null : 'Ingrese una calle.',
                    keyboardType: TextInputType.emailAddress,
                ),
                 ),
                 Visibility(
                   visible: _visible,
                   child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.edit_location),
                      hintText: 'Ingrese el número exterior',
                      labelText: '# exterior',
                    ),
                    validator: (value) => isValidEmail(value)
                        ? null
                        : 'Ingrese un numero exterior.',
                    keyboardType: TextInputType.emailAddress,
                ),
                 ),
                 Visibility(
                   visible: _visible,
                   child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.edit_location),
                      hintText: 'Número el numero interior',
                      labelText: '# interior',
                    ),
                    validator: (value) => isValidEmail(value)
                        ? null
                        : 'Ingrese un numero interior.',
                    keyboardType: TextInputType.emailAddress,
                ),
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
                      onPressed: () {
                       if (_keyFormClient.currentState.validate())
                        _neverSatisfied();
                      }),
                ),
              ],
            )),
      ),
    );
  }

  Future<void> _neverSatisfied() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alta de cliente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('¿Esta seguro de crear el cliente?')],
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
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  void _onChanged(String value) {
    setState(() {
      coloniaSelected = value;
    });
  }
}
