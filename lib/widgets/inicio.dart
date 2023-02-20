import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EíColaí'),
        centerTitle: true,
      ),       
      body: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration:  const BoxDecoration(
            image:  DecorationImage(image:  AssetImage("assets/images/background.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('EiColaí', style: TextStyle(fontSize: 40, color: Colors.white,),)
              
              
            ],
          ),
        ),
         Container(
          margin: EdgeInsets.only(bottom: 50, top: 50),
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: [ 
              SizedBox(
            
            height: 50,
            width: double.infinity,
            child: ElevatedButton.icon(
              
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, onSurface: Colors.green, elevation: 20,
              shadowColor: Colors.black),
              
              onPressed: (){
                Navigator.of(context).pushNamed('/login');
              },
              icon: const Icon(Icons.login),
              label: const Text('Entrar'),
            ),
          ),
          Container(
            height: 15,
          ),
          SizedBox(
            
            height: 50,
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 20,
                shadowColor: Colors.black
                ),
              onPressed: (){
                Navigator.of(context).pushNamed('/registro');
              },
              icon: const Icon(Icons.co_present),
              label: const Text('Registrar'),
              
              )
          )
      ]),
         )
      ],
    ),
      );
  }
}