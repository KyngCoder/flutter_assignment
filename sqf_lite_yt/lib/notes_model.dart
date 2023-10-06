class NotesModel {
  final int? id;
  final String title;
  final String description;

  NotesModel({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      "description": description,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> results) {
    return NotesModel(
        title: results['title'],
        description: results['description'],
        id: results['id']);
  }
}
