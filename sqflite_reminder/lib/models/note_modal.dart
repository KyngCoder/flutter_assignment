// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NoteModal {
  final String noteTitle;
  final String noteDescription;
  final int? id;
  NoteModal({
    required this.noteTitle,
    required this.noteDescription,
    this.id,
  });

  factory NoteModal.fromJson(Map<String, dynamic> json) {
    return NoteModal(
      id: json['id'] ,
      noteTitle: json["noteTitle"],
      noteDescription: json["noteDescription"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ,
      'noteTitle': noteTitle,
      'noteDescription': noteDescription,
    };
    
  }

 @override
String toString() {
  return 'NoteModal(noteTitle: $noteTitle, noteDescription: $noteDescription, id: ${id ?? 'null'})';
}

}
