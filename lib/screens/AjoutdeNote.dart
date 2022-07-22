import 'package:flutter/material.dart';

class AjoutdeNote extends StatefulWidget {
  AjoutdeNote({Key? key}) : super(key: key);

  @override
  State<AjoutdeNote> createState() => _AjoutdeNoteState();
}

class _AjoutdeNoteState extends State<AjoutdeNote> {

  String body;
  String title;
  DateTime date;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  addNote(NoteModel note){
    DatabaseProvider.db.AddNewNote(note);
    print("La note a bien  était ajoutée");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout d'une nouvelle note"),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric (horizontal: 12.0,vertical:8.0),
        child: Column (
          children: [
            TextField(
              controller:titleController, 
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Titre de Note",
              ),
              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28.0),
            )
            Expanded(
              controller: bodyController,
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Votre note",
                ),
              ),
            ),
          ],
        ),
      ) 
       floatingActionButton: FloatingActionButton.extended(
        onPressed: onPressed: (){
          title = titleController.text;
          body = bodyController.text;
          date = Datime.now();
        });
        NoteModel note = NoteModel(title : title,body:body,date_creation:date);
        addNote(note);
        Navigator.pushNameAndRemoveUntil(context, "/",(route) => false); 
        },
        label: Text("Sauvegarde de Note"),
        icon: Icon(Icon.save),
        ), 
    );
  }
}
