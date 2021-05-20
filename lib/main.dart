import 'package:flutter/material.dart';
import 'package:flutter_todo_app/item.dart';
import 'package:flutter_todo_app/inputitem.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddItem(),
    );
  }
}

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final List<Item> item = [
    Item("ITEM 1"),
    Item("ITEM 2"),

  ];

_addItem(Item obj){
  setState(() {
    item.add(obj);
  });
}
_removeItem(int index){
  setState(() {
    item.removeAt(index);
  });
}
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: Text("TODO LIST"),
        ),
        body: ListView.builder(itemBuilder: (ctx, index) {
          return item.length > index
              ? Card(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  elevation: 5,
                  shadowColor: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(item[index].name),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {

                            //  _removeItem(index);
                          setState(() {
                            item.removeAt(index);
                          });

                        },
                      ),
                    ),
                  ),
                )
              : null;
        }),
       // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(child: Icon(
          Icons.add,
          color: Colors.white,
        ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return  SingleChildScrollView(child: InputItem(_addItem));

                });
          },

        ),
      );
  }
}
