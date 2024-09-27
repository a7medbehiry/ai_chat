
import 'package:hive/hive.dart';

import '../../../../constants.dart';
import 'chat_history.dart';
import 'settings.dart';

class Boxes {
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(kChatHistoryBox);


  static Box<Settings> getSettings() =>
      Hive.box<Settings>(kSettingsBox);
}
