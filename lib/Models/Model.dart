import 'dart:convert';



String routeToJson(Model data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Model {
  String id;
  String title;
  String description;
  String meta;
  String displayName;

  Model({
    this.id,
    this.title,
    this.description,
    this.displayName,
    this.meta,
  });
  static Model modelFromJson(dynamic json) {
    return new Model(id:json['_id'] as String,title: json['title'] as String,description: json['description'] as String,meta: json['meta'] as String,displayName: json['displayName'] as String);
  }

  factory Model.fromMap(Map<String, dynamic> json) { return new Model(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    meta: json["meta"] ,
    displayName: json["displayName"]
  );}

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "meta":meta,
    "displayName":displayName,
  };
}