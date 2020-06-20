import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/model.dart';
import 'package:formvalidation/src/providers/productos_providers.dart';
import 'package:formvalidation/src/utils/Utils.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  ProductoModel productoModel =  new ProductoModel();
  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
            IconButton(
              icon:Icon(Icons.photo_camera),
              onPressed: (){},
            ),
          IconButton(
            icon:Icon(Icons.photo_camera),
            onPressed: (){},
          )
        ],
      ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child:Form(
              key: formKey,
              child:Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearPrecio(),
                  _crearDisponible(),
                  _crearBoton(),
                ],
              )
            ),
          ),
        )
    );
  }

  Widget _crearNombre(){
    return TextFormField(
      initialValue: productoModel.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => productoModel.titulo = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el nombre del producto';
        }else{
          return null;
        }
    },
    );
  }

  Widget _crearPrecio(){
      return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Precio',
        ),
        onSaved: (value) => productoModel.valor =double.parse(value),
        validator: (value){
          if(isNumeric(value)){
            return null;
          } else {
            return 'Solo numeros';
          }

        }
      );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      label: Text('Guardar'),
      color:Colors.deepPurpleAccent,
      icon: Icon(Icons.save),
      textColor: Colors.white,
      onPressed: _submit,
    );
  }

  void _submit(){
    print('todo bien todo bello antioquia');
    if(!formKey.currentState.validate()) return;
    formKey.currentState.save();
    print(productoModel.titulo);
    print(productoModel.valor);
    print(productoModel.disponible);
    productosProvider.crearProducto(productoModel);


  }

  Widget _crearDisponible(){
    return SwitchListTile(
      value: productoModel.disponible,
      title: Text('Disponible'),
      onChanged: (value) => setState(
          (){
            productoModel.disponible = value;
          }
      ),
    );
  }

}
