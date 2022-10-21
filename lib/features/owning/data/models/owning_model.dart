import '../../domain/entities/owning.dart';

class OwningModel extends Owning {
  OwningModel({String? title, int? id}) : super(title: title, id: id);

  factory OwningModel.fromJson(Map<String, dynamic> json) =>
      OwningModel(id: json['id'], title: json['title']);

  Map<String, dynamic> toJson() {
    return {'title': title, 'id': id};
  }
}
