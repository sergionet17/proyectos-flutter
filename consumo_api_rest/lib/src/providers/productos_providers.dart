

import 'dart:convert';

import 'package:formvalidation/src/models/model.dart';
import 'package:http/http.dart' as http;
class ProductosProvider {

  final String _url = 'https://flutter-varios-e2774.firebaseio.com';

  Future<bool>crearProducto(ProductoModel productoModel) async {
    final url = '$_url/productos.json';

    final resp =  await http.post(url,body: productoModelToJson(productoModel));
    final decodeData = json.decode(resp.body);
    
    print(decodeData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async{
    final url = '$_url/productos.json';
    final resp =  await http.get(url);
    print(resp);
    //final decodeData = jsonDecode(resp.body);
    //print(decodeData);

    final Map<String ,dynamic> decodeData = json.decode(resp.body);
    final List <ProductoModel> productos = new List();

    if(decodeData == null) return [];
    
    decodeData.forEach( (id,prod) {

      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
      print(productos);
    });

    return productos;
  }


}