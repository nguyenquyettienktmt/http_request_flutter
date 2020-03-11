import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {

  final String noteID;
  bool get isEditting => noteID != null;

  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditting ? 'Re-Edit' : 'Re-Cre : Note')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: 'Note Title'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Note Contents'
              ),
            ),

            Container(height: 16),

            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Submit',style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(isEditting){
                    //update note in api
                  }else{
                    // create note in api
                  }
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
