import 'package:eicolai/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavCustom extends StatelessWidget { 
      final controller = Get.find<HomeController>();
      final controllertwo = Get.lazyPut(() => HomeController());

   BottomNavCustom({super.key});
      
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Obx( () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: controller.items.map((item) {
            var itemIndex = controller.items.indexOf(item);
            return GestureDetector(
              onTap: () {
                
                  print(itemIndex);
                  controller.choiceIndex(itemIndex);
                
              },
              child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 50,
        width: controller.selectedIndex.value == itemIndex ? 120 : 50,
        padding: controller.selectedIndex.value == itemIndex ? EdgeInsets.only(left: 16, right: 16) : null,
        decoration: controller.selectedIndex.value == itemIndex
            ? BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.all(Radius.circular(50)))
            : null,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: 24,
                    color: controller.selectedIndex.value == itemIndex ? controller.backgroundColorNav : Colors.black,
                  ),
                  child: item.icon,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: controller.selectedIndex.value == itemIndex
                      ? DefaultTextStyle.merge(
                          style: TextStyle(color: controller.backgroundColorNav),
                          child: item.title)
                      : Container(),
                )
              ],
            ),
          ],
        ),
          )
          
              //_buildItem(item, selectedIndex == itemIndex),
            );
          }).toList(),
        ),
      ),
    );
  }

  }
