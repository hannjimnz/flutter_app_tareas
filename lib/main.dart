import 'package:flutter/material.dart';
import 'home_page.dart'; //importamos la pantalla principal 

void main(){
  runApp(const MiAppDeTareas());
}

class MiAppDeTareas extends StatelessWidget{
  const MiAppDeTareas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //quita la etiqueta roja de arriba
      title: 'App',
      home: HomePage(), //definimos donde empezara nestra app, en este caso es el homepage
    );
  }
}