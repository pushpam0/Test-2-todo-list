import 'package:flutter/material.dart';
import 'package:flutter_todo_app/item.dart';

class InputItem extends StatefulWidget {
  final Function additem;

  InputItem(this.additem);

  @override
  _InputItemState createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  String _errorMsg="";

  final titleController = TextEditingController();

  void _add() {

    if (!titleController.text.isEmpty){
      widget.additem(Item(titleController.text));
      Navigator.of(context).pop();
    }
    else{
      setState(() {
        _errorMsg="please enter Item Name";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(20.0), padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(onSubmitted: null, controller: titleController,),
          Text(_errorMsg,style: TextStyle(color: Colors.red),),
          RaisedButton(onPressed: _add

            , child: Text("ADD"),)
        ],
      ),
    );
  }
}
