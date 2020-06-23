import 'package:flutter/material.dart';

import 'basico_page.dart';
import 'card_page.dart';

import 'package:intl/intl.dart';  //for date format
import 'package:intl/date_symbol_data_local.dart';  //for date locale

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context),
        ],
      )
    );
  }

  Widget _pagina1(){
      return Stack(
        children: <Widget>[
          _colorFondo(),
          _imagenFondo(),
          _informacion()
        ],
      );
  }

  Widget _pagina2(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
          child: RaisedButton(
            shape: StadiumBorder(),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
            child: Text('Bienvenidos cara de verga',style: TextStyle(fontSize: 20.0),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)  => CardPage(),
              ));

            },
          )
      ),
    );
  }

  Widget _colorFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );

  }

  Widget _imagenFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        //image: AssetImage('assets/original.png'),
        image: NetworkImage('https://get.pxhere.com/photo/restaurant-dish-meal-food-asia-breakfast-eat-fast-food-lunch-cuisine-asian-food-meals-exotic-supper-brunch-hors-d-oeuvre-chinese-food-971202.jpg'),
        fit:  BoxFit.cover,
      ),
    );
  }

  Widget _informacion(){

    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yy');
    String formatted = formatter.format(now);

    final stiloText = TextStyle(color:Colors.white,fontSize: 50);
    //var now = new DateTime.now();
    var day = new DateTime.now().weekday;
    var dia;
    if(day == 1)
        dia = 'Lunes';
    if(day == 2)
      dia = 'Martes';
    if(day == 3)
      dia = 'Miercoles';
    if(day == 4)
      dia = 'Jueves';
    if(day == 5)
      dia = 'Viernes';
    if(day == 6)
      dia = 'Sabado';
    if(day == 7)
      dia = 'Domingo';

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text(formatted,style: stiloText),
          Text(dia,style: stiloText),
          Expanded(child: Container(),),
          Icon(Icons.keyboard_arrow_down,size: 70.0,color: Colors.white),
        ],
      ),
    );
  }
  }


