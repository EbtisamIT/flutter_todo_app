import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.6),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(

          onTap: (){
            onToDoChanged(todo);
          },
          contentPadding:EdgeInsets.symmetric(vertical: 5,horizontal: 20) ,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          leading: Icon(
             todo.isDone? Icons.check_box : Icons.check_box_outline_blank,color: tdBlue,),
          title: Text(todo.todoText!,
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: todo.isDone? TextDecoration.lineThrough:null,
             ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12,horizontal: 2),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: (){onDeleteItem(todo.id); },
            ),
          ),

        ),
      )
    );
  }
}
