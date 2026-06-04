
//crearemos una clase donde definiremos como es una tarea 

class Tarea {
  //definiremos las propiedades 
  final String id;
  final String titulo;
  bool estaCompletada; // esta no es final porque cambiara entre verdadero y Falso
}

Tarea({
  required this.id, 
});
