
//crearemos una clase donde definiremos como es una tarea 

class Tarea {
  //definiremos las propiedades 
  final String id;
  final String titulo;
  bool estaCompletada; // esta no es final porque cambiara entre verdadero y Falso

  //haremos nuestro constructor 
  //se usa required null safety ya que no se  puede tener una tarea sin un id o un titulo
  Tarea({
  required this.id, 
  required this.titulo, 
  this.estaCompletada = false,// por defecto las tareas nuevas empiezan sin completar 
});

}


