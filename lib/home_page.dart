import 'package:flutter/material.dart';
import 'tarea_modelo.dart';

//se creo una nueva pantalla homepage y se le esta heredando todos los poderes de statefulwidget 
//al usar stateful se le avisa que esta pantalla va a tener cambios de datos a futuro
class HomePage extends StatefulWidget{
  //es el contructor y la super Llave
  //const le dice a flutter que si la pantalla no ha recibido cambios entonces no la volvera a dibular y ahorrara espacio en memoria 
  const HomePage ({super.key});//todos lo widgets necesitan una llave de identificacion unica para el motor de flutter sepa cual widget es cual en el arbol de pantallas, 

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  //aqui vivira la memoria o el estado de nuestra pantalla

  List <Tarea> listaDeTareas =[];
  // ciclo de vida: nacimiento del widget 
  @override
  void initState(){
    super.initState();
    //simulamos algunas tareas al momento de cargar la app 
    listaDeTareas =[
      Tarea(id: '1', titulo: 'Estudiar para la entrevista'),
      Tarea(id: '2', titulo: 'Aprender de la sintaxis')

    ];
  }
  // con este metodo vamos a dibujar la interfaz 
  @override
  Widget build (BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        backgroundColor: Colors.blueAccent,
      ),
      body: listaDeTareas.isEmpty ? const Center(child: Text('No hay tareas pendiente '))
      : ListView.builder(
        itemCount: listaDeTareas.length ,
        itemBuilder: (context, index){
          final tarea = listaDeTareas[index];
          return ListTile(
            title: Text(
              tarea.titulo,
              style: TextStyle(
                //si la tarea esta completa, entonces se tachara
                decoration: tarea.estaCompletada ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            leading: Icon(
              tarea.estaCompletada ? Icons.check_box : Icons.check_box_outline_blank, 
              color: tarea.estaCompletada ? Colors.green : Colors.grey, 
            ),
            onTap: (){
              setState(() {
                tarea.estaCompletada = ! tarea.estaCompletada;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarTarea,
        child: const Icon(Icons.add),
      ),
    );
  }
  //funcion asincrona, esta simulara una peticion a una base de datos en internet 
  Future <void> _guardarTareaEnservidor(Tarea nuevaTarea) async{
    await Future.delayed(const Duration(seconds: 2));
    //despues de los 2 segundos añade la tarea y vuelve a dibujar la IU 
    setState(() {
      listaDeTareas.add(nuevaTarea);
    });

  }
  void _mostrarDialogoAgregarTarea(){
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Nueva Tarea'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: '¿Que tienes que hacer?'),

          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),



            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context), //cierra la ventana 
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async{
                if (textController.text.isEmpty){
                  final nuevaTarea = Tarea(
                    id: DateTime.now().toString(), // id unico basado en el tiempo
                    titulo: textController.text,


                  );
                  Navigator.pop(context);
                  //espera la forma asincrona en la que el servidor responda
                  await _guardarTareaEnservidor(nuevaTarea);
                }
              },
              child: const Text('Guardar'),
            )
          ],

        );
      },

    );

  }

}