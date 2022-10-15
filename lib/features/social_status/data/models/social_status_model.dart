import 'package:admin/features/social_status/domain/entities/social_status.dart';

class SocialStatusModel extends SocialStatus {
  SocialStatusModel({String? title, int? id}) : super(title: title, id: id);

  factory SocialStatusModel.fromJson(Map<String, dynamic> json) =>
      SocialStatusModel(id: json['id'], title: json['title']);

  Map<String, Object?> toJson() {
    return {'title': title, 'id': id};
  }
}
