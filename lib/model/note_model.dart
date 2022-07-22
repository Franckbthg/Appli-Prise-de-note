class NoteModel {
  int id;
  String title;
  String body;
  DateTime date_creation;

  NoteModel({this.id, this.title, this.body, this.date_creation});

  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "title": title,
      "body": body,
      "date_creation": date_creation
    });
  }
}
