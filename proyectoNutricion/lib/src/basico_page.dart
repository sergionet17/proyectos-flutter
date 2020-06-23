import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(
      fontSize: 20.0,fontWeight: FontWeight.bold
  );

  final estiloSubTitulo = TextStyle(
      fontSize: 18.0,color: Colors.green
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _crearImagen(),
              _crearContenido(),
              _crearAcciones(),
              _crearTexto(),
              _crearTexto(),
              _crearTexto(),
              _crearTexto()
            ],
          ),
      )

    );
  }
  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://pixnio.com/free-images/2019/02/10/2019-02-10-17-57-51-1200x900.jpg'),
    );
  }

  Widget _crearContenido(){
    return   SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0
        ),
        child: Row(
          children: <Widget>[

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Almuerzo bueno',style: estiloTitulo),
                  SizedBox(height: 7.0,),
                  Text('Almuerzo  no bueno',style: estiloSubTitulo),
                  SizedBox(height: 7.0,),
                  Text('Almuerzo excelente',style:estiloSubTitulo),
                ],
              ),
            ),

            Icon(Icons.satellite,
                size: 30,
                color:Colors.red
            ),
            Text('41',style: TextStyle(fontSize: 20.0))

          ],
        ),
      ),
    );

  }

  Widget _crearAcciones(){


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call_end,'llamada'),
        _accion(Icons.phone_android,'llamada dos'),
        _accion(Icons.share,'Share')
      ],
    );


  }

  Widget _accion(IconData icon,String texto){
    return  Column(
      children: <Widget>[
        Icon(icon,color: Colors.blue,size: 40.0,),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0,color: Colors.blue),)
      ],
    );
  }

  Widget _crearTexto(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
      child:  Text(
          'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
              'sjdljskldjlsjdklsdllsjdklsdklsldjjsdjlsjdljsldlsjdklssdsdsd'
        ),
    );


  }

  Widget _crearChildren(){
  }

}
