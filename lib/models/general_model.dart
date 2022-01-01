import 'dart:convert';

class GeneralModel {
  GeneralModel({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory GeneralModel.fromRawJson(String str) =>
      GeneralModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeneralModel.fromJson(Map<String, dynamic> json) {
    return GeneralModel(
      id: json["id"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
