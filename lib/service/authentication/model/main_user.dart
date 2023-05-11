import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_user.g.dart';

@JsonSerializable()
class MainUser {
  @HiveField(1, defaultValue: '')
  final String phoneNumber;
  @HiveField(2, defaultValue: '')
  final String uid;

  const MainUser({this.phoneNumber = '', this.uid = ''});

  factory MainUser.fromJson(Map<String, dynamic> json) => _$MainUserFromJson(json);
  Map<String, dynamic> toJson() => _$MainUserToJson(this);
}
