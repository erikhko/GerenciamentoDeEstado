import 'package:aula06/screens/controller/fruit.controller.dart';
import 'package:flutter/material.dart';

import '../util/snnipets.dart';
import 'controller/fruit.controller.dart';
import 'controller/fruit_change_notify.controller.dart';
import 'controller/fruit_getx.controller.dart';
import 'fruit_create.screen.dart';

class FruitListScreen extends StatefulWidget {
  const FruitListScreen({super.key});

  @override
  State<FruitListScreen> createState() => _FruitListScreenState();
}

class _FruitListScreenState extends State<FruitListScreen> {
  late FruitChangeNotifyController _fruitChangeNotifyController;
  late FruitGetController _fruitGetController;

  @override
  void initState() {
    _fruitChangeNotifyController = FruitChangeNotifyController();
    _fruitGetController = FruitGetController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de frutas")),
      body: Obx(() {
        final fruits = _fruitGetController.fruits;
        return ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(fruits[index].name),
              subtitle: Text(fruits[index].price),
            );
          },
        );
      }),
      // body: ListenableBuilder(
      //   listenable: _fruitChangeNotifyController,
      //   builder: (BuildContext context, Widget? child) {
      //     final List<Fruit> values = _fruitChangeNotifyController.fruits;
      //     return ListView.builder(
      //         itemCount: _fruitController.fruits.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           final fruit = _fruitController.fruits[index];
      //           return ListTile(
      //             title: Text(fruit.name),
      //             subtitle: Text("Valor: ${fruit.price}"),
      //             onLongPress: () => _fruitChangeNotifyController.removeFruit(fruit),
      //           );
      //         });
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one_outlined),
        onPressed: () {
          openRoute(
            context,
            FruitCreateScreen(
              onPressed: _fruitGetController.addFruit,
            ),
          );
        },
      ),
    );
  }
}
