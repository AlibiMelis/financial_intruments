import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watchlist.g.dart';

@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'WatchlistAdapter')
class Watchlist {
  @JsonKey(name: 'list', defaultValue: [])
  @HiveField(1, defaultValue: [])
  final List<String> list;

  const Watchlist({this.list = const []});

  factory Watchlist.fromJson(Map<String, dynamic> json) => _$WatchlistFromJson(json);
  Map<String, dynamic> toJson() => _$WatchlistToJson(this);
}
