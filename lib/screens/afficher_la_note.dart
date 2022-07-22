import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/note_model.dart';

class VoirAfficherLaNote extends StatelessWidget {
  const VoirAfficherLaNote
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteModel note = ModalRoute.of.(context).settings as NoteModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Votre Note"),
      ),
      body: Paddding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
             note.title,
             style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0,),
          Text(
            note.body,
            style: TextStyle(fontSize: 18.0),
            )

        ],
      ),
    ),
  );
 }
}
