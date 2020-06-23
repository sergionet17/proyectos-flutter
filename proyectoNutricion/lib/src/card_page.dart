//import 'package:componentes/src/pages/card_page_preparacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdiseno/src/basico_page.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//import 'almuerzo_page.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIEMPO DE COMIDA'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          //_carTipo1(),
          //SizedBox(height: 30.0),
          _carTipo2(context),
          _carTipo3(context)
        ],
      ),
    );
  }

  Widget _carTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.cyan,
            ),
            title: Text('SOY UN TEXTO'),
            subtitle: Text('SOY UN SUB TEXTO'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _carTipo2(BuildContext context) {
    return InkWell(
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('TODO BIEN TODO BELOOO!!!!'),
          ));
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Text('REFRIGERIO REFORZADO'),
              Image(
                image: NetworkImage(
                    'https://p1.pxfuel.com/preview/556/448/852/baguette-close-up-eggs-healthy.jpg'),
              ),
            ],
          ),
        ));
  }

    Widget _carTipo3(BuildContext context) {
    return InkWell(
        
        onTap: () async {

          var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

          // Await the http get response, then decode the json-formatted response.
          var response = await http.get(url);
          if (response.statusCode == 200) {
            var jsonResponse = convert.jsonDecode(response.body);
            var itemCount = jsonResponse['totalItems'];
            print('Number of books about http: $itemCount.');
          } else {
            print('Request failed with status: ${response.statusCode}.');
          }


          Navigator.push(context, MaterialPageRoute(builder: (context)
          => BasicoPage(),
          ));
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('ASI SI !!!!'),
          ));
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Text('ALMUERZO'),
              Image(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_960_720.jpg'),
              ),
            ],
          ),
        ));
  }
}
