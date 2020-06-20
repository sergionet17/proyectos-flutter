import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/model.dart';
import 'package:formvalidation/src/providers/productos_providers.dart';


class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
      /*
      Como pasar satos de una pagina a otra
       */
      /* body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${ bloc.email }'),
            Divider(),
            Text('Password: ${ bloc.password }')
          ],
     * ),*/
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context,i) => _crearItem((productos[i]),context),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },

    );
  }

  Widget _crearItem(ProductoModel productoModel,BuildContext context ){
    print('Este es el contexto');
    print(context);
    return ListTile(
      title: Text('${productoModel.titulo} - ${productoModel.valor} - ${productoModel.disponible}'  ),
      subtitle: Text(productoModel.id),
      onTap:() => Navigator.pushNamed(context, 'producto'),
    );
  }


   _crearBoton(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=> Navigator.pushNamed(context, 'producto'),
    );
  }

}