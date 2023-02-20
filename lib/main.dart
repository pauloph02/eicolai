// ignore_for_file: prefer_const_constructors

import 'package:eicolai/home/home_view.dart';
import 'package:eicolai/provider/agendamentos_provider.dart';
import 'package:eicolai/provider/quadras_provider.dart';
import 'package:eicolai/views/agendamento_form.dart';
import 'package:eicolai/views/quadra_form.dart';
import 'package:eicolai/widgets/inicio.dart';
import 'package:eicolai/widgets/login.dart';
import 'package:eicolai/widgets/registro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AgendamentoProvider>(
      create: (ctx) => AgendamentoProvider(), 
    ), 
      ChangeNotifierProvider(
        create: (ctx) => QuadraProvider(),
      ),  
    
    ],
      builder: (context,  child) {
         return MaterialApp(
            
            title: "EiColaI",
            theme: ThemeData(primarySwatch: Colors.green,
            dividerColor: Colors.green)
            ,
            home: const Inicio(),
            routes: {
              '/login': (context) => const Login(),
              '/inicio': (context) => const Inicio(),
              '/registro':(context) => const Registro(),
              '/homeview':(context) => HomeView(),
              '/quadra_form':(context) => QuadraForm(),
              '/agendamento_form':(context) => AgendamentoForm(),
            }
          );
      //}
  });
    
  }

}