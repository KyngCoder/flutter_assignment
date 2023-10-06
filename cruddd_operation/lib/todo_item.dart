// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class TodoItem {
  String title;
  String description;
  String? id;
  TodoItem({
    required this.title,
    required this.description,
    this.id,
  });

  TodoItem copyWith({
    String? title,
    String? description,
    String? id,
  }) {
    return TodoItem(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItem.fromJson(String source) => TodoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodoItem(title: $title, description: $description, id: $id)';

  @override
  bool operator ==(covariant TodoItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ id.hashCode;
}
