
import '../../domain/entities/housing.dart';

class HousingModel extends Housing {
  HousingModel({String? title, int? id}) : super(title: title, id: id);

  factory HousingModel.fromJson(Map<String, dynamic> json) =>
      HousingModel(id: json['id'], title: json['title']);

  Map<String, dynamic> toJson() {
    return {'title': title, 'id': id};
  }
}
