
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_user_data.g.dart';

@HiveType(typeId: 1)
class UserData extends HiveObject
{
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? profilePic;

  UserData({required this.id, required this.email, required this.profilePic});
}