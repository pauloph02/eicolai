
// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:eicolai/provider/agendamentos_provider.dart';
import 'package:eicolai/widgets/agendamentos.dart';
import 'package:eicolai/widgets/quadras.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eicolai/home/home_controller.dart';
import 'package:provider/provider.dart';
import '../provider/quadras_provider.dart';
import '../widgets/bottomnavcustom.dart';
import '../widgets/perfil.dart';


class HomeView extends GetView<HomeController> {
   HomeView({super.key});
  @override
  final controller = Get.put(HomeController());
  
  @override
  
  Widget build(BuildContext context) {
    final QuadraProvider quadra = Provider.of<QuadraProvider>(context, listen: false);
    final AgendamentoProvider agendamento = Provider.of<AgendamentoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EiColaÍ'),
        centerTitle: true,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
              () => Visibility(
            visible: controller.selectedIndex.value == 0,
            child: Agendamentos()
                    ),
          ), 
           Obx(
              () => Visibility(
              visible: controller.selectedIndex.value == 1,
              child: Quadras()
                    )
          ), 
          Obx(
              () => Visibility(
              visible: controller.selectedIndex.value == 2,
              child: Perfil()
                    )
          )
          ]
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/quadra_form');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
       ),
      
      bottomNavigationBar: BottomNavCustom(
				),
        
        
    );
  }
}