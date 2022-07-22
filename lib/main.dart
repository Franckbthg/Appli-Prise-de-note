import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/database_provider.dart';
import 'screens/AjoutdeNote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // On va utiliser des routes pour naviguer entre les différentes pages
      initialRoute: "/",
      routes: {
        "/": (context) => EcranAccueil(),
        "/AjoutdeNote": (context) => AjoutdeNote(),
      },
    );
  }
}

class EcranAccueil extends StatefulWidget {
  const EcranAccueil({Key? key}) : super(key: key);

  @override
  State<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tes notes"),
        ),
        body: FutureBuilder(
          future: getNotes(),
          builder: (context, noteData) {
            switch (noteData.connectionState) {
              case ConnectionState.waiting:
                {
                  return Center(child: CircularProgressIndicator());
                }
              case ConnectionState.done:
            }
            if (noteData.data == Null) {
              return Center(
                child: Text("Vous n'avez pas encore  de note, créez  en une !"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: noteData.data.length,
                  itemBuilder: (context, index) {
                    String title = noteData.data[index]['title'];
                    String body = noteData.data[index]['body'];
                    String date_creation =
                        noteData.data[index]['date_creation'];
                    int id = noteData.data[index]['id'];
                    return Card(
                      child: ListTile(
                        title: Text(title),
                        subtitle: Text(body),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/AjoutdeNote");
          },
          child: Icon(Icons.note_add),
        ));
  }
}
