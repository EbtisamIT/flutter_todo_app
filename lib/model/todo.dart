class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });
  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: 'Clases',isDone: true),
      ToDo(id: '02', todoText: 'Morning walking',isDone: true),
      ToDo(id: '03', todoText: 'Reading book',isDone: true),
      ToDo(id: '04', todoText: 'Skin care',),
      ToDo(id: '05', todoText: 'Programming ',),


    ];
  }
}