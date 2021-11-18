import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:database_example/models/note.dart';
import 'package:database_example/utils/database_helper.dart';
import 'dart:async';
import 'note_detail.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _noteListState();
  }

}

class _noteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if(noteList == null){
      noteList = <Note>[];
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
          title: Text("Notes")
      ),
      body: getNoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Note("","",2,""),'Add Note');
        },
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteList() {
    TextStyle? titleStyle = Theme
        .of(context)
        .textTheme
        .bodyText2;

    return ListView.builder(
      itemCount: count,
      itemBuilder:(BuildContext context,int position){
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList![position].priority),
              child: getPriorityIcon(this.noteList![position].priority),
            ),
            title: Text(this.noteList![position].title, style: titleStyle,),

            subtitle: Text(this.noteList![position].date),

            trailing: GestureDetector(
              child: Icon(Icons.delete,color: Colors.grey,),
              onTap: () {
                _delete(context, noteList![position]);
              },
            ),

            onTap: (){
              navigateToDetail(this.noteList![position],'Edit Note');
            },
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch(priority){
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async{
    int res = await databaseHelper.deleteNote(note.id);
    if(res != 0){
      _showSnackBar(context,'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context,String msg){
    final snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note,String title) async{
    bool res= await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if(res == true){
      updateListView();
    }
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList){
        setState(() {
          this.noteList=noteList;
          this.count= noteList.length;
        });
      });
    });
  }
}
