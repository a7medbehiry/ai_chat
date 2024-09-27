import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/presentation/providers/chat_provider.dart';
import 'package:test/features/splash/presentation/views/splash_view.dart';

import 'core/helper/on_generate_routes.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/themes/theme.dart';
import 'features/chat/presentation/providers/settings_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.init();
  await ChatProvider.initHive();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child:
          const AIChat(),
      //     DevicePreview(
      //   enabled: true,
      //   builder: (context) => const AIChat(),
      // ),
    ),
  );
}

class AIChat extends StatefulWidget {
  const AIChat({super.key});

  @override
  State<AIChat> createState() => _AIChatState();
}

class _AIChatState extends State<AIChat> {
    @override
  void initState() {
    setTheme();
    super.initState();
  }

  void setTheme() {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.getSavedSettings();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  context.watch<SettingsProvider>().isDarkMode ? darkTheme : lightTheme,
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
