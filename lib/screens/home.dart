import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
   @override
   State<Home> createState() => _HomeState();
    }
    class _HomeState extends State<Home> {

  final todosList = ToDo.todoList();
  final _todoControler=TextEditingController();

@override


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Color(0xff4682A9),
       appBar: AppBar(

         elevation: 0,
         title:Row(
         mainAxisAlignment:MainAxisAlignment.spaceBetween ,
         children: [
           Icon(Icons.menu,color: tdBlack,size:30,)
           ,Container(height: 30,width: 40,
             child: ClipRRect(
               borderRadius: BorderRadius.circular(50),
               child: Image.asset('assets/Avatar.jpg'),),),],),backgroundColor: Color(0xffEEEEEE),),
                body: Stack(
                  children:[ Container(

                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [Container(margin: EdgeInsets.only(left: 15, top: 20,bottom: 20),
                              child: Text("To Do List",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                 color: Color(0xff7C9D96),
                                ),
                              ),
                            ),
                              for (ToDo todoo in todosList)
                                ToDoItem(
                                  todo: todoo,
                                  onToDoChanged: _handleToDoChange,
                                  onDeleteItem:_deleteToDoItem,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20,
                                left: 20,
                                right: 20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5),
                                  decoration: BoxDecoration(color: Colors.white,
                            boxShadow:const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0,0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,),
                                ],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              controller: _todoControler,
                              decoration: InputDecoration(
                                hintText: 'Add new item',
                                border: InputBorder.none
                              ),
                            ),
                          )
                          ),
                          Container(margin: EdgeInsets.only(
                            bottom: 20,right: 20,
                          ),
                          child: ElevatedButton(
                            child: Text("+",style: TextStyle(fontSize: 40,),),
                            onPressed: (){_addToDoItem(_todoControler.text);},
                            style: ElevatedButton.styleFrom(primary: tdBlue,
                                minimumSize:Size(20, 20) ,
                              elevation: 10
                            )
                          ),
                          )
                        ],
                      ),
                    )
                   ]
                ),
              );
            }
       void _handleToDoChange(ToDo todo){
      setState(() {
        todo.isDone=!todo.isDone;
      });
        }
        void _deleteToDoItem(String id){
setState(() {
  todosList.removeWhere((item)=> item.id==id);

});        }
  void _addToDoItem(String toDo){
  setState(() {
    todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: toDo));
  });
  _todoControler.clear();
  }

   Widget searchBox() {
     return Container(
       padding: EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(20),
       ),
       child: TextField(
         decoration: InputDecoration(
           contentPadding: EdgeInsets.all(0),
           prefixIcon: Icon(
             Icons.search,
             color: tdBlack,
             size: 20,
           ),
           prefixIconConstraints: BoxConstraints(
             maxHeight: 20,
             minWidth: 25,
           ),
           border: InputBorder.none,
           hintText: 'Search',
           hintStyle: TextStyle(color: tdGrey),
         ),
       ),
     );
   }


}
