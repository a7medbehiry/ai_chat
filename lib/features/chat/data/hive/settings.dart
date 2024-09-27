import 'package:hive_flutter/hive_flutter.dart';

part 'settings.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  @HiveField(0)
  bool isDarkTheme = false;

  Settings({
    required this.isDarkTheme,
  });
}
