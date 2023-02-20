import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../model/navigationItem.dart';

class HomeController extends GetxController{
  final box = GetStorage('EiColaI');

  RxInt selectedIndex = 0.obs;
      Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(const Icon(Icons.home,color: Color.fromARGB(255, 0, 247, 0),),const Text('Agenda',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),const Color.fromRGBO(223, 215, 243, 1),),
    NavigationItem(const Icon(Icons.sports_soccer_outlined,color: Color.fromARGB(255, 0, 247, 0),),const Text('Quadras',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),const Color.fromRGBO(223, 215, 243, 1)),
    NavigationItem(const Icon(Icons.person_outline, color: Color.fromARGB(255, 0, 247, 0)),const Text('Perfil',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),const Color.fromRGBO(223, 215, 243, 1))
  ];


    void choiceIndex(int index){
      selectedIndex.value = index;
    }


  void logout(){
    box.erase();
    Get.offAllNamed('/login');
  }

  void boxClear(){
    box.erase();
    Get.offAllNamed('/inicio');
  }
}