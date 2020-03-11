import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterserihttprequest/Views/note_delete.dart';
import 'package:flutterserihttprequest/Views/note_modify.dart';
import 'package:flutterserihttprequest/models/note_for_listing.dart';

class NoteList extends StatelessWidget {

  final notes = [
    new NoteForListing(
      noteID: "1",
      noteTitle: "Json 1",
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now()
    ),new NoteForListing(
        noteID: "2",
        noteTitle: "Json 2",
        createDateTime: DateTime.now(),
        lastEditDateTime: DateTime.now()
    ),new NoteForListing(
        noteID: "3",
        noteTitle: "Json 3",
        createDateTime: DateTime.now(),
        lastEditDateTime: DateTime.now()
    ),
  ];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes for ext Json')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (_,__)=> Divider(height: 1,color: Colors.green),
          itemBuilder: (_,index){
            return Dismissible(
              key:  ValueKey(notes[index].noteID),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction){

                },
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context,
                    builder: (_) => NoteDelete()
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16),
                child: Align(child: Icon(Icons.delete,color: Colors.white), alignment: Alignment.centerLeft),
              ),
                child: ListTile(
                  title: Text(
                    notes[index].noteTitle,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text('Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID,)));
                  },
                ),
            );
          },
        itemCount: notes.length, // ad them 30 item
      ),
    );
  }
}
