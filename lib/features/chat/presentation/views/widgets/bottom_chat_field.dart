import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/features/chat/presentation/providers/settings_provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../providers/chat_provider.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({
    super.key,
    required this.chatProvider,
  });

  final ChatProvider chatProvider;

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  final TextEditingController textController = TextEditingController();

  final FocusNode textFieldFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldFocus);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    textFieldFocus.dispose();
    super.dispose();
  }

  Future<void> sendChatMessage({
    required String message,
    required ChatProvider chatProvider,
    required bool isTextOnly,
  }) async {
    try {
      await chatProvider.sentMessage(
        message: message,
        isTextOnly: isTextOnly,
      );
    } catch (e) {
      log('error : $e');
    } finally {
      textController.clear();
      widget.chatProvider.setImagesFileList(listValue: []);
      textFieldFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasImages = widget.chatProvider.imagesFileList != null &&
        widget.chatProvider.imagesFileList!.isNotEmpty;

    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.10)
            : Colors.black.withOpacity(0.10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.32)
              : Colors.white.withOpacity(0.32),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: widget.chatProvider.isLoading
                  ? null
                  : (String value) {
                      if (value.isNotEmpty) {
                        sendChatMessage(
                          message: textController.text,
                          chatProvider: widget.chatProvider,
                          isTextOnly: hasImages ? false : true,
                        );
                      }
                    },
              controller: textController,
              focusNode: textFieldFocus,
              style: isDarkMode
                  ? AppTextStyles.semiBold16
                  : AppTextStyles.semiBold16.copyWith(color: Colors.black),
              cursorColor: isDarkMode ? Colors.white : Colors.black,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.chatProvider.isLoading
                ? null
                : () {
                    if (textController.text.isNotEmpty) {
                      // send the message
                      sendChatMessage(
                        message: textController.text,
                        chatProvider: widget.chatProvider,
                        isTextOnly: hasImages ? false : true,
                      );
                    }
                  },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF10A37F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: isDarkMode
                      ? Image.asset('assets/images/send_chat.png')
                      : Image.asset('assets/images/send_chat_dark.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
